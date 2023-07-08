import 'dart:convert';

PaymentModel paymentModelFromJson(String str) => PaymentModel.fromJson(json.decode(str));

String paymentModelToJson(PaymentModel data) => json.encode(data.toJson());

class PaymentModel {
    String? status;
    Session? session;

    PaymentModel({
         this.status,
         this.session,
    });

    factory PaymentModel.fromJson(Map<String, dynamic> json) => PaymentModel(
        status: json["status"],
        session: Session.fromJson(json["session"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "session": session?.toJson(),
    };
}

class Session {
    String id;
    String object;
    dynamic afterExpiration;
    dynamic allowPromotionCodes;
    int amountSubtotal;
    int amountTotal;
    AutomaticTax automaticTax;
    dynamic billingAddressCollection;
    String cancelUrl;
    String clientReferenceId;
    dynamic consent;
    dynamic consentCollection;
    int created;
    String currency;
    dynamic currencyConversion;
    List<dynamic> customFields;
    CustomText customText;
    dynamic customer;
    String customerCreation;
    CustomerDetails customerDetails;
    String customerEmail;
    int expiresAt;
    dynamic invoice;
    InvoiceCreation invoiceCreation;
    bool livemode;
    dynamic locale;
    Metadata metadata;
    String mode;
    dynamic paymentIntent;
    dynamic paymentLink;
    String paymentMethodCollection;
    Metadata paymentMethodOptions;
    List<String> paymentMethodTypes;
    String paymentStatus;
    PhoneNumberCollection phoneNumberCollection;
    dynamic recoveredFrom;
    dynamic setupIntent;
    dynamic shippingAddressCollection;
    dynamic shippingCost;
    dynamic shippingDetails;
    List<dynamic> shippingOptions;
    String status;
    dynamic submitType;
    dynamic subscription;
    String successUrl;
    TotalDetails totalDetails;
    String url;

    Session({
        required this.id,
        required this.object,
        this.afterExpiration,
        this.allowPromotionCodes,
        required this.amountSubtotal,
        required this.amountTotal,
        required this.automaticTax,
        this.billingAddressCollection,
        required this.cancelUrl,
        required this.clientReferenceId,
        this.consent,
        this.consentCollection,
        required this.created,
        required this.currency,
        this.currencyConversion,
        required this.customFields,
        required this.customText,
        this.customer,
        required this.customerCreation,
        required this.customerDetails,
        required this.customerEmail,
        required this.expiresAt,
        this.invoice,
        required this.invoiceCreation,
        required this.livemode,
        this.locale,
        required this.metadata,
        required this.mode,
        this.paymentIntent,
        this.paymentLink,
        required this.paymentMethodCollection,
        required this.paymentMethodOptions,
        required this.paymentMethodTypes,
        required this.paymentStatus,
        required this.phoneNumberCollection,
        this.recoveredFrom,
        this.setupIntent,
        this.shippingAddressCollection,
        this.shippingCost,
        this.shippingDetails,
        required this.shippingOptions,
        required this.status,
        this.submitType,
        this.subscription,
        required this.successUrl,
        required this.totalDetails,
        required this.url,
    });

    factory Session.fromJson(Map<String, dynamic> json) => Session(
        id: json["id"],
        object: json["object"],
        afterExpiration: json["after_expiration"],
        allowPromotionCodes: json["allow_promotion_codes"],
        amountSubtotal: json["amount_subtotal"],
        amountTotal: json["amount_total"],
        automaticTax: AutomaticTax.fromJson(json["automatic_tax"]),
        billingAddressCollection: json["billing_address_collection"],
        cancelUrl: json["cancel_url"],
        clientReferenceId: json["client_reference_id"],
        consent: json["consent"],
        consentCollection: json["consent_collection"],
        created: json["created"],
        currency: json["currency"],
        currencyConversion: json["currency_conversion"],
        customFields: List<dynamic>.from(json["custom_fields"].map((x) => x)),
        customText: CustomText.fromJson(json["custom_text"]),
        customer: json["customer"],
        customerCreation: json["customer_creation"],
        customerDetails: CustomerDetails.fromJson(json["customer_details"]),
        customerEmail: json["customer_email"],
        expiresAt: json["expires_at"],
        invoice: json["invoice"],
        invoiceCreation: InvoiceCreation.fromJson(json["invoice_creation"]),
        livemode: json["livemode"],
        locale: json["locale"],
        metadata: Metadata.fromJson(json["metadata"]),
        mode: json["mode"],
        paymentIntent: json["payment_intent"],
        paymentLink: json["payment_link"],
        paymentMethodCollection: json["payment_method_collection"],
        paymentMethodOptions: Metadata.fromJson(json["payment_method_options"]),
        paymentMethodTypes: List<String>.from(json["payment_method_types"].map((x) => x)),
        paymentStatus: json["payment_status"],
        phoneNumberCollection: PhoneNumberCollection.fromJson(json["phone_number_collection"]),
        recoveredFrom: json["recovered_from"],
        setupIntent: json["setup_intent"],
        shippingAddressCollection: json["shipping_address_collection"],
        shippingCost: json["shipping_cost"],
        shippingDetails: json["shipping_details"],
        shippingOptions: List<dynamic>.from(json["shipping_options"].map((x) => x)),
        status: json["status"],
        submitType: json["submit_type"],
        subscription: json["subscription"],
        successUrl: json["success_url"],
        totalDetails: TotalDetails.fromJson(json["total_details"]),
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "object": object,
        "after_expiration": afterExpiration,
        "allow_promotion_codes": allowPromotionCodes,
        "amount_subtotal": amountSubtotal,
        "amount_total": amountTotal,
        "automatic_tax": automaticTax.toJson(),
        "billing_address_collection": billingAddressCollection,
        "cancel_url": cancelUrl,
        "client_reference_id": clientReferenceId,
        "consent": consent,
        "consent_collection": consentCollection,
        "created": created,
        "currency": currency,
        "currency_conversion": currencyConversion,
        "custom_fields": List<dynamic>.from(customFields.map((x) => x)),
        "custom_text": customText.toJson(),
        "customer": customer,
        "customer_creation": customerCreation,
        "customer_details": customerDetails.toJson(),
        "customer_email": customerEmail,
        "expires_at": expiresAt,
        "invoice": invoice,
        "invoice_creation": invoiceCreation.toJson(),
        "livemode": livemode,
        "locale": locale,
        "metadata": metadata.toJson(),
        "mode": mode,
        "payment_intent": paymentIntent,
        "payment_link": paymentLink,
        "payment_method_collection": paymentMethodCollection,
        "payment_method_options": paymentMethodOptions.toJson(),
        "payment_method_types": List<dynamic>.from(paymentMethodTypes.map((x) => x)),
        "payment_status": paymentStatus,
        "phone_number_collection": phoneNumberCollection.toJson(),
        "recovered_from": recoveredFrom,
        "setup_intent": setupIntent,
        "shipping_address_collection": shippingAddressCollection,
        "shipping_cost": shippingCost,
        "shipping_details": shippingDetails,
        "shipping_options": List<dynamic>.from(shippingOptions.map((x) => x)),
        "status": status,
        "submit_type": submitType,
        "subscription": subscription,
        "success_url": successUrl,
        "total_details": totalDetails.toJson(),
        "url": url,
    };
}

class AutomaticTax {
    bool enabled;
    dynamic status;

    AutomaticTax({
        required this.enabled,
        this.status,
    });

    factory AutomaticTax.fromJson(Map<String, dynamic> json) => AutomaticTax(
        enabled: json["enabled"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "enabled": enabled,
        "status": status,
    };
}

class CustomText {
    dynamic shippingAddress;
    dynamic submit;

    CustomText({
        this.shippingAddress,
        this.submit,
    });

    factory CustomText.fromJson(Map<String, dynamic> json) => CustomText(
        shippingAddress: json["shipping_address"],
        submit: json["submit"],
    );

    Map<String, dynamic> toJson() => {
        "shipping_address": shippingAddress,
        "submit": submit,
    };
}

class CustomerDetails {
    dynamic address;
    String email;
    dynamic name;
    dynamic phone;
    String taxExempt;
    dynamic taxIds;

    CustomerDetails({
        this.address,
        required this.email,
        this.name,
        this.phone,
        required this.taxExempt,
        this.taxIds,
    });

    factory CustomerDetails.fromJson(Map<String, dynamic> json) => CustomerDetails(
        address: json["address"],
        email: json["email"],
        name: json["name"],
        phone: json["phone"],
        taxExempt: json["tax_exempt"],
        taxIds: json["tax_ids"],
    );

    Map<String, dynamic> toJson() => {
        "address": address,
        "email": email,
        "name": name,
        "phone": phone,
        "tax_exempt": taxExempt,
        "tax_ids": taxIds,
    };
}

class InvoiceCreation {
    bool enabled;
    InvoiceData invoiceData;

    InvoiceCreation({
        required this.enabled,
        required this.invoiceData,
    });

    factory InvoiceCreation.fromJson(Map<String, dynamic> json) => InvoiceCreation(
        enabled: json["enabled"],
        invoiceData: InvoiceData.fromJson(json["invoice_data"]),
    );

    Map<String, dynamic> toJson() => {
        "enabled": enabled,
        "invoice_data": invoiceData.toJson(),
    };
}

class InvoiceData {
    dynamic accountTaxIds;
    dynamic customFields;
    dynamic description;
    dynamic footer;
    Metadata metadata;
    dynamic renderingOptions;

    InvoiceData({
        this.accountTaxIds,
        this.customFields,
        this.description,
        this.footer,
        required this.metadata,
        this.renderingOptions,
    });

    factory InvoiceData.fromJson(Map<String, dynamic> json) => InvoiceData(
        accountTaxIds: json["account_tax_ids"],
        customFields: json["custom_fields"],
        description: json["description"],
        footer: json["footer"],
        metadata: Metadata.fromJson(json["metadata"]),
        renderingOptions: json["rendering_options"],
    );

    Map<String, dynamic> toJson() => {
        "account_tax_ids": accountTaxIds,
        "custom_fields": customFields,
        "description": description,
        "footer": footer,
        "metadata": metadata.toJson(),
        "rendering_options": renderingOptions,
    };
}

class Metadata {
    Metadata();

    factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
    );

    Map<String, dynamic> toJson() => {
    };
}

class PhoneNumberCollection {
    bool enabled;

    PhoneNumberCollection({
        required this.enabled,
    });

    factory PhoneNumberCollection.fromJson(Map<String, dynamic> json) => PhoneNumberCollection(
        enabled: json["enabled"],
    );

    Map<String, dynamic> toJson() => {
        "enabled": enabled,
    };
}

class TotalDetails {
    int amountDiscount;
    int amountShipping;
    int amountTax;

    TotalDetails({
        required this.amountDiscount,
        required this.amountShipping,
        required this.amountTax,
    });

    factory TotalDetails.fromJson(Map<String, dynamic> json) => TotalDetails(
        amountDiscount: json["amount_discount"],
        amountShipping: json["amount_shipping"],
        amountTax: json["amount_tax"],
    );

    Map<String, dynamic> toJson() => {
        "amount_discount": amountDiscount,
        "amount_shipping": amountShipping,
        "amount_tax": amountTax,
    };
}
