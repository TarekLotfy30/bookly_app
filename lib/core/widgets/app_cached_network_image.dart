import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/*
 . الـ Mem Cache (الذاكرة المؤقتة - RAM)
 تستخدمه دائمًا (لازم تحدده) في القوائم والـ لسته.
 
 وظيفته: بيحدد حجم الصورة وهي "مفكوك ضغطها" وجاهزة للعرض على الشاشة.
 مثال: عندك لسته فيه 100 كتاب. لو كل صورة كتاب حجمها الأصلي 
 3000 ^ 3000، الموبايل هيفرقع
 فبتقول له:
 "يا RAM
 ، خدي نسخة صغيرة $400 ^ 600$ على قد الـ 
 Widget بس".
 
 النتيجة: الـ السكرول بيبقى طيارة والتطبيق مش بيهنج.

 */

/*
 الـ Disk Cache (التخزين الدائم - Storage)
تستخدمه فقط لو الصور اللي جاية من السيرفر مساحتها "مرعبة" وعاوز توفر مساحة الموبايل.
 
وظيفته: بيحدد حجم "الملف" اللي هيتسيف على ذاكرة الموبايل (الهارد).

مثال (متى تستخدمه): تطبيق خلفيات موبايل 4K.
الصورة مساحتها 15 ميجا. لو سبتها كاش زي ما هي،
لمستخدم هيلاقي التطبيق واخد 5 جيجا من مساحة الموبايل في يومين

هنا تقول له: "سيفها عندك بحجم أصغر شوية عشان توفر مساحة".

مثال (متى تتركه - الحالة الأفضل): تطبيق كتب أو متجر. الصور مساحتها صغيرة (200 كيلوبايت).
سيبه فاضي عشان الصورة تتخزن بجودتها الأصلية، ولما المستخدم يفتح "تفاصيل الكتاب" ويشوف الصورة كبيرة، تظهر واضحة ونظيفة.
 */

class AppCachedNetworkImage extends StatelessWidget {
  const AppCachedNetworkImage({
    super.key,
    required this.imageUrl,
    required this.memCacheHeight,
    required this.memCacheWidth,
    required this.fit,
  });

  final String imageUrl;
  final int memCacheHeight;
  final int memCacheWidth;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: fit,
      filterQuality: FilterQuality.medium,
      // ✅ استخدم ده دايماً في الـ Lists عشان الـ RAM والـ Scroll
      // مثال: صور مصغرة للكتب، بروفايل يوزر في لستة
      memCacheHeight: memCacheHeight,
      memCacheWidth: memCacheWidth,
      // ❌ سيب ده فاضي (Default) في أغلب الحالات
      // إلا لو الصور اللي بتجيلك من اللينك حجمها "ميجا بايتس" كتير وعاوز توفر مساحة الهارد
      // maxHeightDiskCache: 800,
      fadeInDuration: const Duration(milliseconds: 500),
      fadeInCurve: Curves.easeIn,
      placeholderFadeInDuration: const Duration(milliseconds: 500),
      placeholder: (context, url) => ColoredBox(
        color: Theme.of(context).colorScheme.surfaceVariant,
        child: Center(
          child: CircularProgressIndicator(
            strokeWidth: 2,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
      errorWidget: (context, url, error) => ColoredBox(
        color: Theme.of(context).colorScheme.errorContainer,
        child: Icon(
          Icons.broken_image_outlined,
          color: Theme.of(context).colorScheme.onErrorContainer,
          size: 32,
        ),
      ),
      // imageBuilder: (context, imageProvider) => Container(
      //   decoration: BoxDecoration(
      //     image: DecorationImage(image: imageProvider, fit: BoxFit.fill),
      //   ),
      // ),
    );
  }
}
