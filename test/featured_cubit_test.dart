// ══════════════════════════════════════════════════════════════════════
//  ليه Unit Test أصلاً؟
//
//  تخيل عندك زر في التطبيق بيجيب كتب من الإنترنت.
//  كل مرة تغير كود → تفتح التطبيق → تضغط الزر → تشوف النتيجة.
//  ده بيخدلك 30 ثانية كل مرة.
//
//  بدل كده، تكتب test بيعمل نفس الشيء في 0.01 ثانية.
//  ومش بس كده — بيتأكد إن الكود شغال صح حتى لو الإنترنت مش موجود.
// ══════════════════════════════════════════════════════════════════════

// ══════════════════════════════════════════════════════════════════════
//  المشكلة الكبيرة — الـ API
//
//  FeaturedBooksCubit بيعمل إيه بالظبط؟
//
//  cubit.fetchFeaturedBooks()
//      │
//      ▼
//  useCase.call(NoParams())
//      │
//      ▼
//  repo.fetchFeaturedBooks()
//      │
//      ▼
//  HTTP Request → Google Books API 🌐
//
//  المشكلة:
//  ❌ لو مفيش نت → الـ test هيفشل (وده مش غلطة في الكود!)
//  ❌ بطيء — 500ms لكل test
//  ❌ Google ممكن يرجعلك بيانات مختلفة كل مرة
//  ❌ ممكن تتبان rate limit
//
//  الحل: Mockito
//  بدل ما تبعت request حقيقي، تقول للـ test:
//  "لما الـ useCase يتكلم، ارجعله البيانات دي أنا" ✅
// ══════════════════════════════════════════════════════════════════════

// ══════════════════════════════════════════════════════════════════════
//  Mockito بالبساطة ده زي Postman للـ Unit Tests
//
//  في Postman بتعمل إيه؟
//  → بتقول: "لو جاءك request على /volumes، ارجع البيانات دي"
//
//  في Mockito بتعمل نفس الكلام:
//  → بتقول: "لو الـ useCase اتعملت call، ارجع الـ books دي"
//
//  الفرق:
//  Postman  → بتعمل mock للـ API server
//  Mockito  → بتعمل mock للـ class نفسه جوا الكود
// ══════════════════════════════════════════════════════════════════════

import 'package:bloc_test/bloc_test.dart';
import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:bookly/features/home/presentation/controllers/featured_books_cubit/featured_books_cubit.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart' hide any;
import 'package:mockito/mockito.dart' show any;

// ══════════════════════════════════════════════════════════════════════
//  الخطوة 1: قول لـ Mockito إيه اللي هيتعمله Mock
//
//  @GenerateMocks([FetchFeaturedBooksUseCase])
//  → ده بيقول: "اعمل class اسمه MockFetchFeaturedBooksUseCase"
//  → بعد ما تكتبه، شغّل الأمر ده في الـ terminal:
//     flutter pub run build_runner build
//  → هيعمل ملف اسمه cubit_test.mocks.dart تلقائياً
// ══════════════════════════════════════════════════════════════════════
@GenerateMocks([FetchFeaturedBooksUseCase])
import 'featured_cubit_test.mocks.dart'; // ← الملف ده بيتعمل تلقائياً

// ══════════════════════════════════════════════════════════════════════
//  الخطوة 2: البيانات التجريبية (Fixtures)
//
//  دي بيانات وهمية — مش من API حقيقي.
//  انت اللي بتحددها وبتقول: "افترض إن الـ API رجّع الكتاب ده"
// ══════════════════════════════════════════════════════════════════════
const tBook = BookEntity(
  bookId: 'book-001',
  image: 'https://example.com/cover.jpg',
  title: 'Clean Code',
  authorName: 'Robert C. Martin',
  price: 0,
  rating: 4.8,
  category: 'Programming',
  previewLink: null,
);
final tBooks = [tBook]; // ← قائمة فيها كتاب واحد (بيانات وهمية)
const tErrorMessage = 'Server error occurred';
final tFailure = ServerFailure(tErrorMessage); // ← error وهمي

// ══════════════════════════════════════════════════════════════════════
//  الخطوة 3: اكتب الـ Tests
// ══════════════════════════════════════════════════════════════════════
void main() {
  group('FeaturedBooksCubit', () {
    late MockFetchFeaturedBooksUseCase mockUseCase;
    // ↑ MockFetchFeaturedBooksUseCase = نفس FetchFeaturedBooksUseCase
    //   بس بدل ما تروح الـ API، بترجع اللي انت قلتله

    setUp(() {
      // setUp → بيتشغل قبل كل test
      // بنعمل mock جديد نضيف قبل كل test
      mockUseCase = MockFetchFeaturedBooksUseCase();
    });

    // ══════════════════════════════════════════════════════════════════
    //  TEST 1: الـ Initial State
    //
    //  السؤال: لما أعمل الـ cubit، الـ state الأولاني إيه؟
    //  المتوقع: FeaturedBooksInitial
    // ══════════════════════════════════════════════════════════════════
    test('initial state should be FeaturedBooksInitial', () async {
      final cubit = FeaturedBooksCubit(mockUseCase);

      // expect(الواقع, المتوقع)
      expect(cubit.state, isA<FeaturedBooksInitial>());

      await cubit.close(); // مهم: نقفل الـ cubit بعد الـ test
    });

    // ══════════════════════════════════════════════════════════════════
    //  TEST 2: لما الـ API ينجح
    //
    //  السؤال: لو الـ API رجع كتب، الـ states هتكون إيه بالترتيب؟
    //
    //  المتوقع:
    //  1. FeaturedBooksLoading  ← أول ما نبدأ نجيب البيانات
    //  2. FeaturedBooksSuccess  ← لما البيانات تجي
    //
    //  blocTest هو اللي بيمسك الـ states دي كلها بالترتيب
    // ══════════════════════════════════════════════════════════════════
    blocTest<FeaturedBooksCubit, FeaturedBooksState>(
      'emits [Loading, Success] when fetchFeaturedBooks succeeds',

      build: () {
        // ─── ARRANGE ───────────────────────────────────────────────
        // when(...)  → "لما تعمل call للـ useCase"
        // .thenAnswer → "ارجع الـ value ده"
        //
        // ده مش بيبعت request حقيقي !
        // ده بيقول: "لو الكود طلب من الـ useCase، ارجعله tBooks"
        when(mockUseCase.call(any)).thenAnswer((_) async => Right(tBooks));
        //                   ↑
        //                   any = أي argument (NoParams في حالتنا)

        return FeaturedBooksCubit(mockUseCase);
        //     ↑
        //     بنبعت الـ mock بدل الـ useCase الحقيقي
        //     الـ cubit مش هيعرف الفرق !
      },

      // ─── ACT ─────────────────────────────────────────────────────
      // الـ function اللي إحنا بنتستها
      act: (cubit) => cubit.fetchFeaturedBooks(),

      // ─── ASSERT ──────────────────────────────────────────────────
      // هي دي قائمة الـ states المتوقعة بالترتيب
      expect: () => [
        isA<FeaturedBooksLoading>(), // ← الأول: loading
        isA<FeaturedBooksSuccess>(), // ← تاني: success
      ],
    );

    // ══════════════════════════════════════════════════════════════════
    //  TEST 3: التأكد إن الـ Success فيه البيانات الصح
    //
    //  مش بس بنتأكد إن الـ state هو Success،
    //  لأ، بنتأكد كمان إن state.books == tBooks
    // ══════════════════════════════════════════════════════════════════
    blocTest<FeaturedBooksCubit, FeaturedBooksState>(
      'FeaturedBooksSuccess should contain the correct books list',
      build: () {
        when(mockUseCase.call(any)).thenAnswer((_) async => Right(tBooks));
        return FeaturedBooksCubit(mockUseCase);
      },
      act: (cubit) => cubit.fetchFeaturedBooks(),
      expect: () => [
        isA<FeaturedBooksLoading>(),
        predicate<FeaturedBooksState>(
          // predicate → بيعملك custom check
          // بيدي الـ state ويستنى منك true أو false
          (state) =>
              state is FeaturedBooksSuccess &&
              state.books == tBooks, // ← هل الكتب صح؟
          'FeaturedBooksSuccess with tBooks', // ← رسالة الـ error لو فشل
        ),
      ],
    );

    // ══════════════════════════════════════════════════════════════════
    //  TEST 4: لما الـ API يفشل
    //
    //  السؤال: لو الـ API رجع error، الـ states هتكون إيه؟
    //
    //  المتوقع:
    //  1. FeaturedBooksLoading  ← أول ما نبدأ
    //  2. FeaturedBooksFailure  ← لما يفشل
    // ══════════════════════════════════════════════════════════════════
    blocTest<FeaturedBooksCubit, FeaturedBooksState>(
      'emits [Loading, Failure] when fetchFeaturedBooks fails',
      build: () {
        // هنا بدل Right(tBooks) بنرجع Left(tFailure)
        // Left = failure في الـ Either pattern
        when(mockUseCase.call(any)).thenAnswer((_) async => Left(tFailure));
        return FeaturedBooksCubit(mockUseCase);
      },
      act: (cubit) => cubit.fetchFeaturedBooks(),
      expect: () => [
        isA<FeaturedBooksLoading>(),
        isA<FeaturedBooksFailure>(), // ← بدل Success جه Failure
      ],
    );

    // ══════════════════════════════════════════════════════════════════
    //  TEST 5: التأكد إن رسالة الـ Error صح
    //
    //  مش بس بنتأكد إن الـ state هو Failure،
    //  بنتأكد كمان إن state.errorMessage == 'Server error occurred'
    // ══════════════════════════════════════════════════════════════════
    blocTest<FeaturedBooksCubit, FeaturedBooksState>(
      'FeaturedBooksFailure should carry the exact error message',
      build: () {
        when(mockUseCase.call(any)).thenAnswer((_) async => Left(tFailure));
        return FeaturedBooksCubit(mockUseCase);
      },
      act: (cubit) => cubit.fetchFeaturedBooks(),
      expect: () => [
        isA<FeaturedBooksLoading>(),
        predicate<FeaturedBooksState>(
          (state) =>
              state is FeaturedBooksFailure &&
              state.errorMessage == tErrorMessage, // ← هل الرسالة صح؟
          'FeaturedBooksFailure with correct message',
        ),
      ],
    );

    // ══════════════════════════════════════════════════════════════════
    //  TEST 6: الـ Cache Guard
    //
    //  في الكود عندك السطر ده:
    //  if (state is FeaturedBooksSuccess) return;
    //
    //  ده معناه: لو البيانات اتجبت قبل كده، ماتجيبش تاني.
    //
    //  السؤال: لو الـ state بالفعل Success وعملنا fetchFeaturedBooks،
    //          هيتعمل request؟
    //  المتوقع: لأ — مفيش states جديدة ومفيش call للـ useCase
    // ══════════════════════════════════════════════════════════════════
    blocTest<FeaturedBooksCubit, FeaturedBooksState>(
      'emits nothing if state is already FeaturedBooksSuccess (cache guard)',
      build: () {
        when(mockUseCase.call(any)).thenAnswer((_) async => Right(tBooks));
        return FeaturedBooksCubit(mockUseCase)
          ..emit(FeaturedBooksSuccess(tBooks));
        // ↑ بنخلي الـ cubit يبدأ بـ Success مباشرة
        // زي ما البيانات اتجبت قبل كده
      },
      act: (cubit) => cubit.fetchFeaturedBooks(), // بنحاول نجيب تاني
      expect: () => [], // ← مفيش states جديدة اتعملت
      verify: (cubit) => verifyNever(mockUseCase.call(any)),
      // verifyNever ↑ = تأكد إن الـ useCase ما اتكلمش خالص
    );
  });
}

// ══════════════════════════════════════════════════════════════════════
//  ملخص: الفرق بين الـ 3 حاجات الأساسية
//
//  when(...).thenAnswer(...)
//  → قول للـ mock "لما تتكلم ارجع كده"
//  → ده بيحل مشكلة الـ API
//
//  expect: () => [...]
//  → قول للـ test "الـ states المتوقعة بالترتيب دي"
//  → ده بيتحقق إن الـ cubit شغال صح
//
//  verify(...) / verifyNever(...)
//  → قول للـ test "تأكد إن الـ function دي اتكلمت / ما اتكلمتش"
//  → ده بيتحقق إن الكود بيعمل الحاجة الصح في الوقت الصح
// ══════════════════════════════════════════════════════════════════════
