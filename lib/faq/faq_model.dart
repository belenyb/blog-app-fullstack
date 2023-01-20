// To parse this JSON data, do
//
//     final faq = faqFromJson(jsonString);

import 'dart:convert';

class Faq {
    Faq({
        this.id,
        this.date,
        this.dateGmt,
        this.guid,
        this.modified,
        this.modifiedGmt,
        this.slug,
        this.status,
        this.type,
        this.link,
        this.title,
        this.content,
        this.excerpt,
        this.author,
        this.featuredMedia,
        this.parent,
        this.menuOrder,
        this.commentStatus,
        this.pingStatus,
        this.template,
        this.meta,
        this.yoastHead,
        this.yoastHeadJson,
        this.links,
    });

    final int? id;
    final DateTime? date;
    final DateTime? dateGmt;
    final Guid? guid;
    final DateTime? modified;
    final DateTime? modifiedGmt;
    final String? slug;
    final String? status;
    final String? type;
    final String? link;
    final Guid? title;
    final Content? content;
    final Content? excerpt;
    final int? author;
    final int? featuredMedia;
    final int? parent;
    final int? menuOrder;
    final String? commentStatus;
    final String? pingStatus;
    final String? template;
    final Meta? meta;
    final String? yoastHead;
    final YoastHeadJson? yoastHeadJson;
    final Links? links;

    factory Faq.fromRawJson(String str) => Faq.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Faq.fromJson(Map<String, dynamic> json) => Faq(
        id: json["id"],
        date: DateTime.parse(json["date"]),
        dateGmt: DateTime.parse(json["date_gmt"]),
        guid: Guid.fromJson(json["guid"]),
        modified: DateTime.parse(json["modified"]),
        modifiedGmt: DateTime.parse(json["modified_gmt"]),
        slug: json["slug"],
        status: json["status"],
        type: json["type"],
        link: json["link"],
        title: Guid.fromJson(json["title"]),
        content: Content.fromJson(json["content"]),
        excerpt: Content.fromJson(json["excerpt"]),
        author: json["author"],
        featuredMedia: json["featured_media"],
        parent: json["parent"],
        menuOrder: json["menu_order"],
        commentStatus: json["comment_status"],
        pingStatus: json["ping_status"],
        template: json["template"],
        meta: Meta.fromJson(json["meta"]),
        yoastHead: json["yoast_head"],
        yoastHeadJson: YoastHeadJson.fromJson(json["yoast_head_json"]),
        links: Links.fromJson(json["_links"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "date": date?.toIso8601String(),
        "date_gmt": dateGmt?.toIso8601String(),
        "guid": guid!.toJson(),
        "modified": modified?.toIso8601String(),
        "modified_gmt": modifiedGmt?.toIso8601String(),
        "slug": slug,
        "status": status,
        "type": type,
        "link": link,
        "title": title!.toJson(),
        "content": content!.toJson(),
        "excerpt": excerpt!.toJson(),
        "author": author,
        "featured_media": featuredMedia,
        "parent": parent,
        "menu_order": menuOrder,
        "comment_status": commentStatus,
        "ping_status": pingStatus,
        "template": template,
        "meta": meta!.toJson(),
        "yoast_head": yoastHead,
        "yoast_head_json": yoastHeadJson!.toJson(),
        "_links": links!.toJson(),
    };
}

class Content {
    Content({
        this.rendered,
        this.protected,
    });

    final String? rendered;
    final bool? protected;

    factory Content.fromRawJson(String str) => Content.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Content.fromJson(Map<String, dynamic> json) => Content(
        rendered: json["rendered"],
        protected: json["protected"],
    );

    Map<String, dynamic> toJson() => {
        "rendered": rendered,
        "protected": protected,
    };
}

class Guid {
    Guid({
        this.rendered,
    });

    final String? rendered;

    factory Guid.fromRawJson(String str) => Guid.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Guid.fromJson(Map<String, dynamic> json) => Guid(
        rendered: json["rendered"],
    );

    Map<String, dynamic> toJson() => {
        "rendered": rendered,
    };
}

class Links {
    Links({
        this.self,
        this.collection,
        this.about,
        this.author,
        this.replies,
        this.versionHistory,
        this.predecessorVersion,
        this.wpAttachment,
        this.curies,
    });

    final List<About?>? self;
    final List<About?>? collection;
    final List<About?>? about;
    final List<Author?>? author;
    final List<Author?>? replies;
    final List<VersionHistory?>? versionHistory;
    final List<PredecessorVersion?>? predecessorVersion;
    final List<About?>? wpAttachment;
    final List<Cury?>? curies;

    factory Links.fromRawJson(String str) => Links.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: json["self"] == null ? [] : List<About?>.from(json["self"]!.map((x) => About.fromJson(x))),
        collection: json["collection"] == null ? [] : List<About?>.from(json["collection"]!.map((x) => About.fromJson(x))),
        about: json["about"] == null ? [] : List<About?>.from(json["about"]!.map((x) => About.fromJson(x))),
        author: json["author"] == null ? [] : List<Author?>.from(json["author"]!.map((x) => Author.fromJson(x))),
        replies: json["replies"] == null ? [] : List<Author?>.from(json["replies"]!.map((x) => Author.fromJson(x))),
        versionHistory: json["version-history"] == null ? [] : List<VersionHistory?>.from(json["version-history"]!.map((x) => VersionHistory.fromJson(x))),
        predecessorVersion: json["predecessor-version"] == null ? [] : List<PredecessorVersion?>.from(json["predecessor-version"]!.map((x) => PredecessorVersion.fromJson(x))),
        wpAttachment: json["wp:attachment"] == null ? [] : List<About?>.from(json["wp:attachment"]!.map((x) => About.fromJson(x))),
        curies: json["curies"] == null ? [] : List<Cury?>.from(json["curies"]!.map((x) => Cury.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "self": self == null ? [] : List<dynamic>.from(self!.map((x) => x!.toJson())),
        "collection": collection == null ? [] : List<dynamic>.from(collection!.map((x) => x!.toJson())),
        "about": about == null ? [] : List<dynamic>.from(about!.map((x) => x!.toJson())),
        "author": author == null ? [] : List<dynamic>.from(author!.map((x) => x!.toJson())),
        "replies": replies == null ? [] : List<dynamic>.from(replies!.map((x) => x!.toJson())),
        "version-history": versionHistory == null ? [] : List<dynamic>.from(versionHistory!.map((x) => x!.toJson())),
        "predecessor-version": predecessorVersion == null ? [] : List<dynamic>.from(predecessorVersion!.map((x) => x!.toJson())),
        "wp:attachment": wpAttachment == null ? [] : List<dynamic>.from(wpAttachment!.map((x) => x!.toJson())),
        "curies": curies == null ? [] : List<dynamic>.from(curies!.map((x) => x!.toJson())),
    };
}

class About {
    About({
        this.href,
    });

    final String? href;

    factory About.fromRawJson(String str) => About.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory About.fromJson(Map<String, dynamic> json) => About(
        href: json["href"],
    );

    Map<String, dynamic> toJson() => {
        "href": href,
    };
}

class Author {
    Author({
        this.embeddable,
        this.href,
    });

    final bool? embeddable;
    final String? href;

    factory Author.fromRawJson(String str) => Author.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Author.fromJson(Map<String, dynamic> json) => Author(
        embeddable: json["embeddable"],
        href: json["href"],
    );

    Map<String, dynamic> toJson() => {
        "embeddable": embeddable,
        "href": href,
    };
}

class Cury {
    Cury({
        this.name,
        this.href,
        this.templated,
    });

    final String? name;
    final String? href;
    final bool? templated;

    factory Cury.fromRawJson(String str) => Cury.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Cury.fromJson(Map<String, dynamic> json) => Cury(
        name: json["name"],
        href: json["href"],
        templated: json["templated"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "href": href,
        "templated": templated,
    };
}

class PredecessorVersion {
    PredecessorVersion({
        this.id,
        this.href,
    });

    final int? id;
    final String? href;

    factory PredecessorVersion.fromRawJson(String str) => PredecessorVersion.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PredecessorVersion.fromJson(Map<String, dynamic> json) => PredecessorVersion(
        id: json["id"],
        href: json["href"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "href": href,
    };
}

class VersionHistory {
    VersionHistory({
        this.count,
        this.href,
    });

    final int? count;
    final String? href;

    factory VersionHistory.fromRawJson(String str) => VersionHistory.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory VersionHistory.fromJson(Map<String, dynamic> json) => VersionHistory(
        count: json["count"],
        href: json["href"],
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "href": href,
    };
}

class Meta {
    Meta({
        this.omDisableAllCampaigns,
        this.miSkipTracking,
        this.siteSidebarLayout,
        this.siteContentLayout,
        this.astGlobalHeaderDisplay,
        this.astMainHeaderDisplay,
        this.astHfbAboveHeaderDisplay,
        this.astHfbBelowHeaderDisplay,
        this.astHfbMobileHeaderDisplay,
        this.sitePostTitle,
        this.astBreadcrumbsContent,
        this.astFeaturedImg,
        this.footerSmlLayout,
        this.themeTransparentHeaderMeta,
        this.advHeaderIdMeta,
        this.stickHeaderMeta,
        this.headerAboveStickMeta,
        this.headerMainStickMeta,
        this.headerBelowStickMeta,
        this.joinchat,
    });

    final bool? omDisableAllCampaigns;
    final bool? miSkipTracking;
    final String? siteSidebarLayout;
    final String? siteContentLayout;
    final String? astGlobalHeaderDisplay;
    final String? astMainHeaderDisplay;
    final String? astHfbAboveHeaderDisplay;
    final String? astHfbBelowHeaderDisplay;
    final String? astHfbMobileHeaderDisplay;
    final String? sitePostTitle;
    final String? astBreadcrumbsContent;
    final String? astFeaturedImg;
    final String? footerSmlLayout;
    final String? themeTransparentHeaderMeta;
    final String? advHeaderIdMeta;
    final String? stickHeaderMeta;
    final String? headerAboveStickMeta;
    final String? headerMainStickMeta;
    final String? headerBelowStickMeta;
    final List<dynamic>? joinchat;

    factory Meta.fromRawJson(String str) => Meta.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        omDisableAllCampaigns: json["om_disable_all_campaigns"],
        miSkipTracking: json["_mi_skip_tracking"],
        siteSidebarLayout: json["site-sidebar-layout"],
        siteContentLayout: json["site-content-layout"],
        astGlobalHeaderDisplay: json["ast-global-header-display"],
        astMainHeaderDisplay: json["ast-main-header-display"],
        astHfbAboveHeaderDisplay: json["ast-hfb-above-header-display"],
        astHfbBelowHeaderDisplay: json["ast-hfb-below-header-display"],
        astHfbMobileHeaderDisplay: json["ast-hfb-mobile-header-display"],
        sitePostTitle: json["site-post-title"],
        astBreadcrumbsContent: json["ast-breadcrumbs-content"],
        astFeaturedImg: json["ast-featured-img"],
        footerSmlLayout: json["footer-sml-layout"],
        themeTransparentHeaderMeta: json["theme-transparent-header-meta"],
        advHeaderIdMeta: json["adv-header-id-meta"],
        stickHeaderMeta: json["stick-header-meta"],
        headerAboveStickMeta: json["header-above-stick-meta"],
        headerMainStickMeta: json["header-main-stick-meta"],
        headerBelowStickMeta: json["header-below-stick-meta"],
        joinchat: json["_joinchat"] == null ? [] : List<dynamic>.from(json["_joinchat"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "om_disable_all_campaigns": omDisableAllCampaigns,
        "_mi_skip_tracking": miSkipTracking,
        "site-sidebar-layout": siteSidebarLayout,
        "site-content-layout": siteContentLayout,
        "ast-global-header-display": astGlobalHeaderDisplay,
        "ast-main-header-display": astMainHeaderDisplay,
        "ast-hfb-above-header-display": astHfbAboveHeaderDisplay,
        "ast-hfb-below-header-display": astHfbBelowHeaderDisplay,
        "ast-hfb-mobile-header-display": astHfbMobileHeaderDisplay,
        "site-post-title": sitePostTitle,
        "ast-breadcrumbs-content": astBreadcrumbsContent,
        "ast-featured-img": astFeaturedImg,
        "footer-sml-layout": footerSmlLayout,
        "theme-transparent-header-meta": themeTransparentHeaderMeta,
        "adv-header-id-meta": advHeaderIdMeta,
        "stick-header-meta": stickHeaderMeta,
        "header-above-stick-meta": headerAboveStickMeta,
        "header-main-stick-meta": headerMainStickMeta,
        "header-below-stick-meta": headerBelowStickMeta,
        "_joinchat": joinchat == null ? [] : List<dynamic>.from(joinchat!.map((x) => x)),
    };
}

class YoastHeadJson {
    YoastHeadJson({
        this.title,
        this.robots,
        this.canonical,
        this.ogLocale,
        this.ogType,
        this.ogTitle,
        this.ogDescription,
        this.ogUrl,
        this.ogSiteName,
        this.twitterCard,
        this.schema,
    });

    final String? title;
    final Robots? robots;
    final String? canonical;
    final String? ogLocale;
    final String? ogType;
    final String? ogTitle;
    final String? ogDescription;
    final String? ogUrl;
    final String? ogSiteName;
    final String? twitterCard;
    final Schema? schema;

    factory YoastHeadJson.fromRawJson(String str) => YoastHeadJson.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory YoastHeadJson.fromJson(Map<String, dynamic> json) => YoastHeadJson(
        title: json["title"],
        robots: Robots.fromJson(json["robots"]),
        canonical: json["canonical"],
        ogLocale: json["og_locale"],
        ogType: json["og_type"],
        ogTitle: json["og_title"],
        ogDescription: json["og_description"],
        ogUrl: json["og_url"],
        ogSiteName: json["og_site_name"],
        twitterCard: json["twitter_card"],
        schema: Schema.fromJson(json["schema"]),
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "robots": robots!.toJson(),
        "canonical": canonical,
        "og_locale": ogLocale,
        "og_type": ogType,
        "og_title": ogTitle,
        "og_description": ogDescription,
        "og_url": ogUrl,
        "og_site_name": ogSiteName,
        "twitter_card": twitterCard,
        "schema": schema!.toJson(),
    };
}

class Robots {
    Robots({
        this.index,
        this.follow,
        this.maxSnippet,
        this.maxImagePreview,
        this.maxVideoPreview,
    });

    final String? index;
    final String? follow;
    final String? maxSnippet;
    final String? maxImagePreview;
    final String? maxVideoPreview;

    factory Robots.fromRawJson(String str) => Robots.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Robots.fromJson(Map<String, dynamic> json) => Robots(
        index: json["index"],
        follow: json["follow"],
        maxSnippet: json["max-snippet"],
        maxImagePreview: json["max-image-preview"],
        maxVideoPreview: json["max-video-preview"],
    );

    Map<String, dynamic> toJson() => {
        "index": index,
        "follow": follow,
        "max-snippet": maxSnippet,
        "max-image-preview": maxImagePreview,
        "max-video-preview": maxVideoPreview,
    };
}

class Schema {
    Schema({
        this.context,
        this.graph,
    });

    final String? context;
    final List<Graph?>? graph;

    factory Schema.fromRawJson(String str) => Schema.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Schema.fromJson(Map<String, dynamic> json) => Schema(
        context: json["@context"],
        graph: json["@graph"] == null ? [] : List<Graph?>.from(json["@graph"]!.map((x) => Graph.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "@context": context,
        "@graph": graph == null ? [] : List<dynamic>.from(graph!.map((x) => x!.toJson())),
    };
}

class Graph {
    Graph({
        this.type,
        this.id,
        this.url,
        this.name,
        this.inLanguage,
        this.potentialAction,
        this.itemListElement,
        this.description,
        this.sameAs,
    });

    final String? type;
    final String? id;
    final String? url;
    final String? name;
    final String? inLanguage;
    final List<PotentialAction?>? potentialAction;
    final List<ItemListElement?>? itemListElement;
    final String? description;
    final List<String?>? sameAs;

    factory Graph.fromRawJson(String str) => Graph.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Graph.fromJson(Map<String, dynamic> json) => Graph(
        type: json["type"],
        id: json["id"],
        url: json["url"],
        name: json["name"],
        inLanguage: json["inLanguage"],
        potentialAction: json["potentialAction"] == null ? [] : json["potentialAction"] == null ? [] : List<PotentialAction?>.from(json["potentialAction"]!.map((x) => PotentialAction.fromJson(x))),
        itemListElement: json["itemListElement"] == null ? [] : json["itemListElement"] == null ? [] : List<ItemListElement?>.from(json["itemListElement"]!.map((x) => ItemListElement.fromJson(x))),
        description: json["description"],
        sameAs: json["sameAs"] == null ? [] : json["sameAs"] == null ? [] : List<String?>.from(json["sameAs"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "id": id,
        "url": url,
        "name": name,
        "inLanguage": inLanguage,
        "potentialAction": potentialAction == null ? [] : potentialAction == null ? [] : List<dynamic>.from(potentialAction!.map((x) => x!.toJson())),
        "itemListElement": itemListElement == null ? [] : itemListElement == null ? [] : List<dynamic>.from(itemListElement!.map((x) => x!.toJson())),
        "description": description,
        "sameAs": sameAs == null ? [] : sameAs == null ? [] : List<dynamic>.from(sameAs!.map((x) => x)),
    };
}

class Breadcrumb {
    Breadcrumb({
        this.id,
    });

    final String? id;

    factory Breadcrumb.fromRawJson(String str) => Breadcrumb.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Breadcrumb.fromJson(Map<String, dynamic> json) => Breadcrumb(
        id: json["@id"],
    );

    Map<String, dynamic> toJson() => {
        "@id": id,
    };
}

class ItemListElement {
    ItemListElement({
        this.type,
        this.position,
        this.name,
        this.item,
    });

    final String? type;
    final int? position;
    final String? name;
    final String? item;

    factory ItemListElement.fromRawJson(String str) => ItemListElement.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ItemListElement.fromJson(Map<String, dynamic> json) => ItemListElement(
        type: json["@type"],
        position: json["position"],
        name: json["name"],
        item: json["item"],
    );

    Map<String, dynamic> toJson() => {
        "@type": type,
        "position": position,
        "name": name,
        "item": item,
    };
}

class Logo {
    Logo({
        this.type,
        this.inLanguage,
        this.id,
        this.url,
        this.contentUrl,
        this.width,
        this.height,
        this.caption,
    });

    final String? type;
    final String? inLanguage;
    final String? id;
    final String? url;
    final String? contentUrl;
    final int? width;
    final int? height;
    final String? caption;

    factory Logo.fromRawJson(String str) => Logo.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Logo.fromJson(Map<String, dynamic> json) => Logo(
        type: json["@type"],
        inLanguage: json["inLanguage"],
        id: json["@id"],
        url: json["url"],
        contentUrl: json["contentUrl"],
        width: json["width"],
        height: json["height"],
        caption: json["caption"],
    );

    Map<String, dynamic> toJson() => {
        "@type": type,
        "inLanguage": inLanguage,
        "@id": id,
        "url": url,
        "contentUrl": contentUrl,
        "width": width,
        "height": height,
        "caption": caption,
    };
}

class PotentialAction {
    PotentialAction({
        this.type,
        this.target,
        this.queryInput,
    });

    final String? type;
    final dynamic target;
    final String? queryInput;

    factory PotentialAction.fromRawJson(String str) => PotentialAction.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PotentialAction.fromJson(Map<String, dynamic> json) => PotentialAction(
        type: json["@type"],
        target: json["target"],
        queryInput: json["query-input"],
    );

    Map<String, dynamic> toJson() => {
        "@type": type,
        "target": target,
        "query-input": queryInput,
    };
}

class TargetClass {
    TargetClass({
        this.type,
        this.urlTemplate,
    });

    final String? type;
    final String? urlTemplate;

    factory TargetClass.fromRawJson(String str) => TargetClass.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory TargetClass.fromJson(Map<String, dynamic> json) => TargetClass(
        type: json["@type"],
        urlTemplate: json["urlTemplate"],
    );

    Map<String, dynamic> toJson() => {
        "@type": type,
        "urlTemplate": urlTemplate,
    };
}
