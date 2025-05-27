class ProductsModel {
  List<Product>? data;
  Links? links;
  Meta? meta;

  ProductsModel({this.data, this.links, this.meta});

  ProductsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Product>[];
      json['data'].forEach((v) {
        data!.add(Product.fromJson(v));
      });
    }
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (links != null) {
      data['links'] = links!.toJson();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    return data;
  }
}

class Product {
  int? id;
  String? title;
  String? detail;
  List? meta;
  int? price;
  String? owner;
  Null parentId;
  Null attributeTermId;
  Mediaurls? mediaUrls;
  String? createdAt;
  String? updatedAt;
  List? addonGroups;
  List<Categories>? categories;
  List<VendorProducts>? vendorProducts;
  int? ratings;
  int? ratingsCount;
  int? favouriteCount;
  bool? isFavourite;
  int? sellsCount;

  Product(
      {this.id,
      this.title,
      this.detail,
      this.meta,
      this.price,
      this.owner,
      this.parentId,
      this.attributeTermId,
      this.mediaUrls,
      this.createdAt,
      this.updatedAt,
      this.addonGroups,
      this.categories,
      this.vendorProducts,
      this.ratings,
      this.ratingsCount,
      this.favouriteCount,
      this.isFavourite,
      this.sellsCount});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    detail = json['detail'];
    if (json['meta'] != null) {
      meta = <Null>[];
      json['meta'].forEach((v) {
        meta!.add(v);
      });
    }
    price = json['price'];
    owner = json['owner'];
    parentId = json['parent_id'];
    attributeTermId = json['attribute_term_id'];
    mediaUrls = json['mediaurls'] != null ? Mediaurls.fromJson(json['mediaurls']) : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['addon_groups'] != null) {
      addonGroups = <Null>[];
      json['addon_groups'].forEach((v) {
        addonGroups!.add(v);
      });
    }
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
    if (json['vendor_products'] != null) {
      vendorProducts = <VendorProducts>[];
      json['vendor_products'].forEach((v) {
        vendorProducts!.add(VendorProducts.fromJson(v));
      });
    }
    ratings = json['ratings'];
    ratingsCount = json['ratings_count'];
    favouriteCount = json['favourite_count'];
    isFavourite = json['is_favourite'];
    sellsCount = json['sells_count'];
  }

  get name => null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['detail'] = detail;
    if (meta != null) {
      data['meta'] = meta!.map((v) => v.toJson()).toList();
    }
    data['price'] = price;
    data['owner'] = owner;
    data['parent_id'] = parentId;
    data['attribute_term_id'] = attributeTermId;
    if (mediaUrls != null) {
      data['mediaurls'] = mediaUrls!.toJson();
    }
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (addonGroups != null) {
      data['addon_groups'] = addonGroups!.map((v) => v.toJson()).toList();
    }
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    if (vendorProducts != null) {
      data['vendor_products'] = vendorProducts!.map((v) => v.toJson()).toList();
    }
    data['ratings'] = ratings;
    data['ratings_count'] = ratingsCount;
    data['favourite_count'] = favouriteCount;
    data['is_favourite'] = isFavourite;
    data['sells_count'] = sellsCount;
    return data;
  }
}

class Mediaurls {
  List<Images>? images;

  Mediaurls({this.images});

  Mediaurls.fromJson(Map<String, dynamic> json) {
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categories {
  int? id;
  String? slug;
  String? title;
  TitleTranslations? titleTranslations;
  Meta? meta;
  int? sortOrder;
  Mediaurls? mediaurls;
  Null parentId;

  Categories(
      {this.id,
      this.slug,
      this.title,
      this.titleTranslations,
      this.meta,
      this.sortOrder,
      this.mediaurls,
      this.parentId});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    title = json['title'];
    titleTranslations =
        json['title_translations'] != null ? TitleTranslations.fromJson(json['title_translations']) : null;
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    sortOrder = json['sort_order'];
    mediaurls = json['mediaurls'] != null ? Mediaurls.fromJson(json['mediaurls']) : null;
    parentId = json['parent_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['slug'] = slug;
    data['title'] = title;
    if (titleTranslations != null) {
      data['title_translations'] = titleTranslations!.toJson();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    data['sort_order'] = sortOrder;
    if (mediaurls != null) {
      data['mediaurls'] = mediaurls!.toJson();
    }
    data['parent_id'] = parentId;
    return data;
  }
}

class TitleTranslations {
  String? en;
  String? ar;

  TitleTranslations({this.en, this.ar});

  TitleTranslations.fromJson(Map<String, dynamic> json) {
    en = json['en'];
    ar = json['ar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['en'] = en;
    data['ar'] = ar;
    return data;
  }
}

class Images {
  String? image;
  String? thumb;

  Images({this.image, this.thumb});

  Images.fromJson(Map<String, dynamic> json) {
    image = json['default'];
    thumb = json['thumb'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['default'] = image;
    data['thumb'] = thumb;
    return data;
  }
}

class VendorProducts {
  int? id;
  int? price;
  Null salePrice;
  Null salePriceFrom;
  Null salePriceTo;
  int? stockQuantity;
  int? stockLowThreshold;
  int? productId;
  int? vendorId;
  Vendor? vendor;
  int? sellsCount;

  VendorProducts(
      {this.id,
      this.price,
      this.salePrice,
      this.salePriceFrom,
      this.salePriceTo,
      this.stockQuantity,
      this.stockLowThreshold,
      this.productId,
      this.vendorId,
      this.vendor,
      this.sellsCount});

  VendorProducts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    salePrice = json['sale_price'];
    salePriceFrom = json['sale_price_from'];
    salePriceTo = json['sale_price_to'];
    stockQuantity = json['stock_quantity'];
    stockLowThreshold = json['stock_low_threshold'];
    productId = json['product_id'];
    vendorId = json['vendor_id'];
    vendor = json['vendor'] != null ? Vendor.fromJson(json['vendor']) : null;
    sellsCount = json['sells_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['price'] = price;
    data['sale_price'] = salePrice;
    data['sale_price_from'] = salePriceFrom;
    data['sale_price_to'] = salePriceTo;
    data['stock_quantity'] = stockQuantity;
    data['stock_low_threshold'] = stockLowThreshold;
    data['product_id'] = productId;
    data['vendor_id'] = vendorId;
    if (vendor != null) {
      data['vendor'] = vendor!.toJson();
    }
    data['sells_count'] = sellsCount;
    return data;
  }
}

class Vendor {
  int? id;
  String? name;
  String? tagline;
  String? details;
  List? meta;
  Mediaurls? mediaurls;
  int? minimumOrder;
  int? deliveryFee;
  String? area;
  String? address;
  double? longitude;
  double? latitude;
  int? isVerified;
  int? userId;
  String? createdAt;
  String? updatedAt;
  List<Categories>? categories;
  List<ProductCategory>? productCategories;
  User? user;
  int? ratings;
  int? ratingsCount;
  int? favouriteCount;
  bool? isFavourite;
  Null distance;

  Vendor(
      {this.id,
      this.name,
      this.tagline,
      this.details,
      this.meta,
      this.mediaurls,
      this.minimumOrder,
      this.deliveryFee,
      this.area,
      this.address,
      this.longitude,
      this.latitude,
      this.isVerified,
      this.userId,
      this.createdAt,
      this.updatedAt,
      this.categories,
      this.productCategories,
      this.user,
      this.ratings,
      this.ratingsCount,
      this.favouriteCount,
      this.isFavourite,
      this.distance});

  Vendor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    tagline = json['tagline'];
    details = json['details'];
    if (json['meta'] != null) {
      meta = <Null>[];
      json['meta'].forEach((v) {
        meta!.add(v);
      });
    }
    mediaurls = json['mediaurls'] != null ? Mediaurls.fromJson(json['mediaurls']) : null;
    minimumOrder = json['minimum_order'];
    deliveryFee = json['delivery_fee'];
    area = json['area'];
    address = json['address'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    isVerified = json['is_verified'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
    if (json['product_categories'] != null) {
      productCategories = <ProductCategory>[];
      json['product_categories'].forEach((v) {
        productCategories!.add(ProductCategory.fromJson(v));
      });
    }
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    ratings = json['ratings'];
    ratingsCount = json['ratings_count'];
    favouriteCount = json['favourite_count'];
    isFavourite = json['is_favourite'];
    distance = json['distance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['tagline'] = tagline;
    data['details'] = details;
    if (meta != null) {
      data['meta'] = meta!.map((v) => v.toJson()).toList();
    }
    if (mediaurls != null) {
      data['mediaurls'] = mediaurls!.toJson();
    }
    data['minimum_order'] = minimumOrder;
    data['delivery_fee'] = deliveryFee;
    data['area'] = area;
    data['address'] = address;
    data['longitude'] = longitude;
    data['latitude'] = latitude;
    data['is_verified'] = isVerified;
    data['user_id'] = userId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    if (productCategories != null) {
      data['product_categories'] = productCategories!.map((v) => v.toJson()).toList();
    }
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['ratings'] = ratings;
    data['ratings_count'] = ratingsCount;
    data['favourite_count'] = favouriteCount;
    data['is_favourite'] = isFavourite;
    data['distance'] = distance;
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  Null username;
  String? mobileNumber;
  int? mobileVerified;
  int? isVerified;
  int? active;
  String? language;
  Null notification;
  Null meta;
  Null rememberToken;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
      this.name,
      this.email,
      this.username,
      this.mobileNumber,
      this.mobileVerified,
      this.isVerified,
      this.active,
      this.language,
      this.notification,
      this.meta,
      this.rememberToken,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    username = json['username'];
    mobileNumber = json['mobile_number'];
    mobileVerified = json['mobile_verified'];
    isVerified = json['is_verified'];
    active = json['active'];
    language = json['language'];
    notification = json['notification'];
    meta = json['meta'];
    rememberToken = json['remember_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['username'] = username;
    data['mobile_number'] = mobileNumber;
    data['mobile_verified'] = mobileVerified;
    data['is_verified'] = isVerified;
    data['active'] = active;
    data['language'] = language;
    data['notification'] = notification;
    data['meta'] = meta;
    data['remember_token'] = rememberToken;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Links {
  String? first;
  String? last;
  Null prev;
  String? next;

  Links({this.first, this.last, this.prev, this.next});

  Links.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    last = json['last'];
    prev = json['prev'];
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first'] = first;
    data['last'] = last;
    data['prev'] = prev;
    data['next'] = next;
    return data;
  }
}

class Meta {
  int? currentPage;
  int? from;
  int? lastPage;
  String? path;
  int? perPage;
  int? to;
  int? total;
  String? scope;
  String? number;

  Meta(
      {this.scope,
      this.number,
      this.currentPage,
      this.from,
      this.lastPage,
      this.path,
      this.perPage,
      this.to,
      this.total});

  Meta.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    from = json['from'];
    lastPage = json['last_page'];
    path = json['path'];
    perPage = json['per_page'];
    to = json['to'];
    total = json['total'];
    scope = json['scope'];
    number = json['number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_page'] = currentPage;
    data['from'] = from;
    data['last_page'] = lastPage;
    data['path'] = path;
    data['per_page'] = perPage;
    data['to'] = to;
    data['scope'] = scope;
    data['number'] = number;
    data['total'] = total;
    return data;
  }
}

class ProductCategories {
  List<ProductCategory>? productCategories;

  ProductCategories({this.productCategories});

  ProductCategories.fromJson(Map<String, dynamic> json) {
    if (json['product_categories'] != null) {
      productCategories = <ProductCategory>[];
      json['product_categories'].forEach((v) {
        productCategories!.add(ProductCategory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (productCategories != null) {
      data['product_categories'] = productCategories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductCategory {
  int? id;
  String? slug;
  String? title;
  TitleTranslations? titleTranslations;
  Meta? meta;
  int? sortOrder;
  Mediaurls? mediaurls;
  Null parentId;

  ProductCategory(
      {this.id,
      this.slug,
      this.title,
      this.titleTranslations,
      this.meta,
      this.sortOrder,
      this.mediaurls,
      this.parentId});

  ProductCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    title = json['title'];
    titleTranslations =
        json['title_translations'] != null ? TitleTranslations.fromJson(json['title_translations']) : null;
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    sortOrder = json['sort_order'];
    mediaurls = json['mediaurls'] != null ? Mediaurls.fromJson(json['mediaurls']) : null;
    parentId = json['parent_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['slug'] = slug;
    data['title'] = title;
    if (titleTranslations != null) {
      data['title_translations'] = titleTranslations!.toJson();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    data['sort_order'] = sortOrder;
    if (mediaurls != null) {
      data['mediaurls'] = mediaurls!.toJson();
    }
    data['parent_id'] = parentId;
    return data;
  }
}
