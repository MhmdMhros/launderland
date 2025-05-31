class OrdersModel {
  List<OrderData>? orderData;
  Links? links;
  Meta? meta;

  OrdersModel({this.orderData, this.links, this.meta});

  OrdersModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      orderData = <OrderData>[];
      json['data'].forEach((v) {
        orderData!.add(OrderData.fromJson(v));
      });
    }
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (orderData != null) {
      data['data'] = orderData!.map((v) => v.toJson()).toList();
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

class OrderData {
  int? id;
  // Null notes;
  Meta? meta;
  num? subtotal;
  num? taxes;
  num? deliveryFee;
  num? total;
  num? discount;
  String? orderType;
  String? type;
  num? isGuest;
  String? scheduledOn;
  String? status;
  num? vendorId;
  num? userId;
  String? createdAt;
  String? updatedAt;
  List<Products>? products;
  Vendor? vendor;
  User? user;
  Address? address;
  Null sourceAddress;
  Null delivery;
  Payment? payment;
  Null deliveryMode;
  Null customerName;
  Null customerEmail;
  Null customerMobile;

  OrderData(
      {this.id,
      // this.notes,
      this.meta,
      this.subtotal,
      this.taxes,
      this.deliveryFee,
      this.total,
      this.discount,
      this.orderType,
      this.type,
      this.isGuest,
      this.scheduledOn,
      this.status,
      this.vendorId,
      this.userId,
      this.createdAt,
      this.updatedAt,
      this.products,
      this.vendor,
      this.user,
      this.address,
      this.sourceAddress,
      this.delivery,
      this.payment,
      this.deliveryMode,
      this.customerName,
      this.customerEmail,
      this.customerMobile});

  OrderData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    // notes = json['notes'];
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    subtotal = json['subtotal'];
    taxes = json['taxes'];
    deliveryFee = json['delivery_fee'];
    total = json['total'];
    discount = json['discount'];
    orderType = json['order_type'];
    type = json['type'];
    isGuest = json['is_guest'];
    scheduledOn = json['scheduled_on'];
    status = json['status'];
    vendorId = json['vendor_id'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
    vendor = json['vendor'] != null ? Vendor.fromJson(json['vendor']) : null;
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    address =
        json['address'] != null ? Address.fromJson(json['address']) : null;
    sourceAddress = json['source_address'];
    delivery = json['delivery'];
    payment =
        json['payment'] != null ? Payment.fromJson(json['payment']) : null;
    deliveryMode = json['delivery_mode'];
    customerName = json['customer_name'];
    customerEmail = json['customer_email'];
    customerMobile = json['customer_mobile'];
  }

  get date => null;

  get time => null;

  get totalAmount => null;

  get items => null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    // data['notes'] = notes;
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    data['subtotal'] = subtotal;
    data['taxes'] = taxes;
    data['delivery_fee'] = deliveryFee;
    data['total'] = total;
    data['discount'] = discount;
    data['order_type'] = orderType;
    data['type'] = type;
    data['is_guest'] = isGuest;
    data['scheduled_on'] = scheduledOn;
    data['status'] = status;
    data['vendor_id'] = vendorId;
    data['user_id'] = userId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    if (vendor != null) {
      data['vendor'] = vendor!.toJson();
    }
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (address != null) {
      data['address'] = address!.toJson();
    }
    data['source_address'] = sourceAddress;
    data['delivery'] = delivery;
    if (payment != null) {
      data['payment'] = payment!.toJson();
    }
    data['delivery_mode'] = deliveryMode;
    data['customer_name'] = customerName;
    data['customer_email'] = customerEmail;
    data['customer_mobile'] = customerMobile;
    return data;
  }
}

class Products {
  int? id;
  int? quantity;
  int? total;
  Null subtotal;
  int? orderId;
  Null vendorProductId;
  VendorProduct? vendorProduct;

  Products({
    this.id,
    this.quantity,
    this.total,
    this.subtotal,
    this.orderId,
    this.vendorProductId,
    this.vendorProduct,
  });

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    total = json['total'];
    subtotal = json['subtotal'];
    orderId = json['order_id'];
    vendorProductId = json['vendor_product_id'];
    vendorProduct = json['vendor_product'] != null
        ? VendorProduct.fromJson(json['vendor_product'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['quantity'] = quantity;
    data['total'] = total;
    data['subtotal'] = subtotal;
    data['order_id'] = orderId;
    data['vendor_product_id'] = vendorProductId;
    if (vendorProduct != null) {
      data['vendor_product'] = vendorProduct!.toJson();
    }

    return data;
  }
}

class VendorProduct {
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
  Product? product;

  VendorProduct(
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
      this.product});

  VendorProduct.fromJson(Map<String, dynamic> json) {
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
    product =
        json['product'] != null ? Product.fromJson(json['product']) : null;
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
    if (product != null) {
      data['product'] = product!.toJson();
    }
    return data;
  }
}

class Vendor {
  int? id;
  String? name;
  String? tagline;
  String? details;
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

    mediaurls = json['mediaurls'] != null
        ? Mediaurls.fromJson(json['mediaurls'])
        : null;
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
    titleTranslations = json['title_translations'] != null
        ? TitleTranslations.fromJson(json['title_translations'])
        : null;
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    sortOrder = json['sort_order'];
    mediaurls = json['mediaurls'] != null
        ? Mediaurls.fromJson(json['mediaurls'])
        : null;
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
    data['remember_token'] = rememberToken;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Product {
  int? id;
  String? title;
  String? detail;
  int? price;
  String? owner;
  Null parentId;
  Null attributeTermId;
  Mediaurls? mediaurls;
  List<Categories>? categories;
  String? createdAt;
  String? updatedAt;

  Product(
      {this.id,
      this.title,
      this.detail,
      this.price,
      this.owner,
      this.parentId,
      this.attributeTermId,
      this.mediaurls,
      this.categories,
      this.createdAt,
      this.updatedAt});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    detail = json['detail'];

    price = json['price'];
    owner = json['owner'];
    parentId = json['parent_id'];
    attributeTermId = json['attribute_term_id'];
    mediaurls = json['mediaurls'] != null
        ? Mediaurls.fromJson(json['mediaurls'])
        : null;
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['detail'] = detail;

    data['price'] = price;
    data['owner'] = owner;
    data['parent_id'] = parentId;
    data['attribute_term_id'] = attributeTermId;
    if (mediaurls != null) {
      data['mediaurls'] = mediaurls!.toJson();
    }
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Meta {
  String? key;
  String? scope;
  int? value;
  int? currentPage;
  int? from;
  int? lastPage;
  String? number;
  String? path;
  int? perPage;
  int? to;
  int? total;

  Meta(
      {this.scope,
      this.key,
      this.value,
      this.currentPage,
      this.from,
      this.number,
      this.lastPage,
      this.path,
      this.perPage,
      this.to,
      this.total});

  Meta.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    value = json['value'];
    number = json['number'];
    scope = json['scope'];
    currentPage = json['current_page'];
    from = json['from'];
    lastPage = json['last_page'];
    path = json['path'];
    perPage = json['per_page'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['key'] = key;
    data['value'] = value;
    data['scope'] = scope;
    data['number'] = number;

    data['current_page'] = currentPage;
    data['from'] = from;
    data['last_page'] = lastPage;
    data['path'] = path;
    data['per_page'] = perPage;
    data['to'] = to;
    data['total'] = total;
    return data;
  }
}

class Wallet {
  int? id;
  int? userId;
  int? balance;
  String? createdAt;
  String? updatedAt;

  Wallet({this.id, this.userId, this.balance, this.createdAt, this.updatedAt});

  Wallet.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    balance = json['balance'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['balance'] = balance;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Address {
  int? id;
  Null name;
  Null email;
  Null mobile;
  String? formattedAddress;
  Null address1;
  Null address2;
  double? longitude;
  double? latitude;
  int? orderId;

  Address(
      {this.id,
      this.name,
      this.email,
      this.mobile,
      this.formattedAddress,
      this.address1,
      this.address2,
      this.longitude,
      this.latitude,
      this.orderId});

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    formattedAddress = json['formatted_address'];
    address1 = json['address1'];
    address2 = json['address2'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    orderId = json['order_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['mobile'] = mobile;
    data['formatted_address'] = formattedAddress;
    data['address1'] = address1;
    data['address2'] = address2;
    data['longitude'] = longitude;
    data['latitude'] = latitude;
    data['order_id'] = orderId;
    return data;
  }
}

class Payment {
  num? id;
  num? payableId;
  num? payerId;
  num? amount;
  String? status;
  PaymentMethod? paymentMethod;

  Payment(
      {this.id,
      this.payableId,
      this.payerId,
      this.amount,
      this.status,
      this.paymentMethod});

  Payment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    payableId = json['payable_id'];
    payerId = json['payer_id'];
    amount = json['amount'];
    status = json['status'];
    paymentMethod = json['payment_method'] != null
        ? PaymentMethod.fromJson(json['payment_method'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['payable_id'] = payableId;
    data['payer_id'] = payerId;
    data['amount'] = amount;
    data['status'] = status;
    if (paymentMethod != null) {
      data['payment_method'] = paymentMethod!.toJson();
    }
    return data;
  }
}

class PaymentMethod {
  int? id;
  String? slug;
  String? title;
  TitleTranslations? titleTranslations;
  String? meta;
  int? enabled;
  String? type;

  PaymentMethod(
      {this.id,
      this.slug,
      this.title,
      this.titleTranslations,
      this.meta,
      this.enabled,
      this.type});

  PaymentMethod.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    title = json['title'];
    titleTranslations = json['title_translations'] != null
        ? TitleTranslations.fromJson(json['title_translations'])
        : null;
    meta = json['meta'];
    enabled = json['enabled'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['slug'] = slug;
    data['title'] = title;
    if (titleTranslations != null) {
      data['title_translations'] = titleTranslations!.toJson();
    }
    data['meta'] = meta;
    data['enabled'] = enabled;
    data['type'] = type;
    return data;
  }
}

class Links {
  String? first;
  String? last;
  String? prev;
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
