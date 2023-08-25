class CouponModels {
  int couponId;
  String couponName;
  int couponCount;
  int couponDiscound;
  String couponExpiredate;

  CouponModels(
      {required this.couponId,
     required this.couponName,
     required this.couponCount,
     required this.couponDiscound,
     required this.couponExpiredate});

  factory CouponModels.fromJson(Map<String, dynamic> json) {
   return CouponModels(
     couponId : json['coupon_id'],
    couponName : json['coupon_name'],
    couponCount : json['coupon_count'],
    couponDiscound : json['coupon_discound'],
    couponExpiredate : json['coupon_expiredate'],
   );
  }
}