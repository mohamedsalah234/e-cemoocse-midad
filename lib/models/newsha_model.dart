class Newsha {
  final int id;
  final String title;
  final String description;
  final String category;
  final double price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final List<String> tags;
  final String brand;
  final String sku;
  final double weight;
  final Dimensions dimensions;
  final String warrantyInformation;
  final String shippingInformation;
  final String availabilityStatus;
  final List<Review> reviews;
  final String image;

  Newsha({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.tags,
    required this.brand,
    required this.sku,
    required this.weight,
    required this.dimensions,
    required this.warrantyInformation,
    required this.shippingInformation,
    required this.availabilityStatus,
    required this.reviews,
    required this.image,
  });

  factory Newsha.fromJson(Map<String, dynamic> json) {
    return Newsha(
      id: json['id'] ?? 0, // التأكد من وجود قيمة صحيحة
      title: json['title'] ?? 'No Title', // توفير قيمة افتراضية
      description:
          json['description'] ?? 'No Description', // توفير قيمة افتراضية
      category: json['category'] ?? 'No Category', // توفير قيمة افتراضية
      price: (json['price'] ?? 0.0).toDouble(), // التأكد من التحويل إلى double
      discountPercentage: (json['discountPercentage'] ?? 0.0)
          .toDouble(), // التأكد من التحويل إلى double
      rating:
          (json['rating'] ?? 0.0).toDouble(), // التأكد من التحويل إلى double
      stock: json['stock'] ?? 0, // توفير قيمة افتراضية
      tags: List<String>.from(
          json['tags'] ?? []), // التعامل مع قائمة فارغة إذا كانت null
      brand: json['brand'] ?? 'Unknown', // توفير قيمة افتراضية
      sku: json['sku'] ?? 'Unknown', // توفير قيمة افتراضية
      weight:
          (json['weight'] ?? 0.0).toDouble(), // التأكد من التحويل إلى double
      dimensions: json['dimensions'] != null
          ? Dimensions.fromJson(json['dimensions'])
          : Dimensions(width: 0, height: 0, depth: 0), // توفير أبعاد افتراضية
      warrantyInformation:
          json['warrantyInformation'] ?? 'No Warranty', // توفير قيمة افتراضية
      shippingInformation: json['shippingInformation'] ??
          'No Shipping Info', // توفير قيمة افتراضية
      availabilityStatus:
          json['availabilityStatus'] ?? 'Unknown', // توفير قيمة افتراضية
      reviews: (json['reviews'] ?? [])
          .map<Review>((review) => Review.fromJson(review))
          .toList(), // التعامل مع قائمة فارغة إذا كانت null
      image: json['image'] ??
          'https://img.freepik.com/free-psd/social-media-stories-easter-offers_220664-4418.jpg?t=st=1722859953~exp=1722863553~hmac=b83e762e871b15772c289383f5a882f7f51ca11ac75f97852458dda5df7dbfaa&w=360', // توفير رابط صورة افتراضية
    );
  }
}

class Dimensions {
  final double width;
  final double height;
  final double depth;

  Dimensions({
    required this.width,
    required this.height,
    required this.depth,
  });

  factory Dimensions.fromJson(Map<String, dynamic> json) {
    return Dimensions(
      width: json['width'].toDouble(),
      height: json['height'].toDouble(),
      depth: json['depth'].toDouble(),
    );
  }
}

class Review {
  final double rating;
  final String comment;
  final String date;
  final String reviewerName;
  final String reviewerEmail;

  Review({
    required this.rating,
    required this.comment,
    required this.date,
    required this.reviewerName,
    required this.reviewerEmail,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      rating: json['rating'].toDouble(),
      comment: json['comment'],
      date: json['date'],
      reviewerName: json['reviewerName'],
      reviewerEmail: json['reviewerEmail'],
    );
  }
}
