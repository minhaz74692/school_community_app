
// import 'package:cached_network_image/cached_network_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart' as cm;
import 'package:shimmer/shimmer.dart';
import 'package:sust_app/utills/theme/apps_colors.dart';

Widget customNetworkImage(String imageUrl, double? height,double? width,) {
  return CachedNetworkImage(
    imageUrl: imageUrl,
    fit: BoxFit.cover,
    width: width,
    height:  height,
    cacheKey: imageUrl,
    cacheManager: cm.CacheManager(cm.Config(imageUrl, stalePeriod: const Duration(hours: 5))),
    errorWidget: (context, url, error) => Image.asset("assets/logo.png", fit: BoxFit.fill),
    placeholder: ((context, url) => Center(
      child: Stack(
        children: [
          Shimmer.fromColors(
              baseColor: Colors.black.withOpacity(.1),
              highlightColor: Colors.grey.withOpacity(.1),
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
              )),
          Opacity(opacity: 0.2, child: Image.asset("assets/logo.png", height: 100, width: 100))
        ],
      ),
    )),
    imageBuilder: (context, imageProvider) => Container(
        width: height,
        height: width,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), image: DecorationImage(image: imageProvider, fit: BoxFit.cover))),
  );
}


Widget circularImage(String imageUrl,  {double? radius= 40,double? height, double? width,}) {
  return CachedNetworkImage(
      cacheKey: imageUrl,
      cacheManager: cm.CacheManager(cm.Config(imageUrl, stalePeriod: const Duration(hours: 5))),
      placeholder: (context, url) =>  Shimmer.fromColors(
        baseColor: const Color(0xffD2D0D1),
        highlightColor: const Color(0xffF7F7F7),
        child: Padding(
          padding: const EdgeInsets.only(left: 4),
          child: Container(
              width: height, height: width,
            decoration: const BoxDecoration( color: Colors.black,shape: BoxShape.circle),
          ),
        ),
      ),
      errorWidget: (context, url, error) => CircleAvatar(
        radius: radius,
        backgroundColor: Colors.white,
        child: Image.asset("assets/circle.png",fit: BoxFit.cover,width: height, height: width),),
      imageBuilder: (context, imageProvider) => Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(shape: BoxShape.circle, image: DecorationImage(image: imageProvider, fit: BoxFit.cover))),
      fit: BoxFit.cover,
      imageUrl: imageUrl);
}

Widget rectangleImage(String imageUrl,{double height = 90,double width = 90,Color? borderColor=AppColors.borderColor}) {
  return CachedNetworkImage(
      cacheKey: imageUrl,
      cacheManager: cm.CacheManager(cm.Config(imageUrl, stalePeriod: const Duration(hours: 5))),
      placeholder: (context, url) => Image.asset("assets/logo.png", fit: BoxFit.cover, width: 90, height: 90 ),
      errorWidget: (context, url, error) => Image.asset("assets/logo.png", fit: BoxFit.fill, width: 90, height: 90),
      imageBuilder: (context, imageProvider) => Container(
          width:width,
          height: height,
          decoration: BoxDecoration(border: Border.all(color: borderColor!,width: 2),shape: BoxShape.rectangle,
              image: DecorationImage(image: imageProvider, fit: BoxFit.cover),borderRadius: BorderRadius.circular(8))),
      fit: BoxFit.cover,
      imageUrl: imageUrl);
}
Widget serviceImage(String imageUrl,{double? width,double? height}) {
  return CachedNetworkImage(
      cacheKey: imageUrl,
      cacheManager: cm.CacheManager(cm.Config(imageUrl, stalePeriod: const Duration(hours: 5))),
      placeholder: (context, url) => Image.asset("assets/logo.png", fit: BoxFit.cover, width:width, height: height),
      errorWidget: (context, url, error) => Image.asset("assets/logo.png", fit: BoxFit.fill, width: width, height:height),
      imageBuilder: (context, imageProvider) => Container(
          width: width,
          height: height,
          decoration: BoxDecoration(border: Border.all(color: AppColors.borderColor,width: 2),
              image: DecorationImage(image: imageProvider, fit: BoxFit.cover),borderRadius: BorderRadius.circular(8))),
      fit: BoxFit.fill,
      imageUrl: imageUrl);
}