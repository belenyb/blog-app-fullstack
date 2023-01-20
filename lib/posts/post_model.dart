// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';

class Post {
  Post({
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
    required this.title,
    required this.content,
    this.excerpt,
    this.author,
    this.featuredMedia,
    this.commentStatus,
    this.pingStatus,
    this.sticky,
    this.template,
    this.format,
    this.meta,
    this.categories,
    required this.tags,
    this.yoastHead,
    this.yoastHeadJson,
    this.links,
    required this.embedded,
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
  final Guid title;
  final Content content;
  final Content? excerpt;
  final int? author;
  final int? featuredMedia;
  final String? commentStatus;
  final String? pingStatus;
  final bool? sticky;
  final String? template;
  final String? format;
  final Meta? meta;
  final List<int>? categories;
  final List<dynamic> tags;
  final String? yoastHead;
  final YoastHeadJson? yoastHeadJson;
  final Links? links;
  final Embedded embedded;

  factory Post.fromRawJson(String str) => Post.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["id"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        dateGmt:
            json["date_gmt"] == null ? null : DateTime.parse(json["date_gmt"]),
        guid: json["guid"] == null ? null : Guid.fromJson(json["guid"]),
        modified:
            json["modified"] == null ? null : DateTime.parse(json["modified"]),
        modifiedGmt: json["modified_gmt"] == null
            ? null
            : DateTime.parse(json["modified_gmt"]),
        slug: json["slug"],
        status: json["status"],
        type: json["type"],
        link: json["link"],
        title: Guid.fromJson(json["title"]),
        content: Content.fromJson(json["content"]),
        excerpt:
            json["excerpt"] == null ? null : Content.fromJson(json["excerpt"]),
        author: json["author"],
        featuredMedia: json["featured_media"],
        commentStatus: json["comment_status"],
        pingStatus: json["ping_status"],
        sticky: json["sticky"],
        template: json["template"],
        format: json["format"],
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
        categories: json["categories"] == null
            ? []
            : List<int>.from(json["categories"]!.map((x) => x)),
        tags: List<dynamic>.from(json["tags"]!.map((x) => x)),
        yoastHead: json["yoast_head"],
        yoastHeadJson: json["yoast_head_json"] == null
            ? null
            : YoastHeadJson.fromJson(json["yoast_head_json"]),
        links: json["_links"] == null ? null : Links.fromJson(json["_links"]),
        embedded: Embedded.fromJson(json["_embedded"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date": date?.toIso8601String(),
        "date_gmt": dateGmt?.toIso8601String(),
        "guid": guid?.toJson(),
        "modified": modified?.toIso8601String(),
        "modified_gmt": modifiedGmt?.toIso8601String(),
        "slug": slug,
        "status": status,
        "type": type,
        "link": link,
        "title": title.toJson(),
        "content": content.toJson(),
        "excerpt": excerpt?.toJson(),
        "author": author,
        "featured_media": featuredMedia,
        "comment_status": commentStatus,
        "ping_status": pingStatus,
        "sticky": sticky,
        "template": template,
        "format": format,
        "meta": meta?.toJson(),
        "categories": categories == null
            ? []
            : List<dynamic>.from(categories!.map((x) => x)),
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "yoast_head": yoastHead,
        "yoast_head_json": yoastHeadJson?.toJson(),
        "_links": links?.toJson(),
        "_embedded": embedded.toJson(),
      };
}

class Embedded {
  Embedded({
    this.author,
    required this.wpFeaturedmedia,
    this.wpTerm,
  });

  final List<EmbeddedAuthor>? author;
  final List<WpFeaturedmedia> wpFeaturedmedia;
  final List<List<EmbeddedWpTerm>>? wpTerm;

  factory Embedded.fromRawJson(String str) =>
      Embedded.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Embedded.fromJson(Map<String, dynamic> json) => Embedded(
        author: json["author"] == null
            ? []
            : List<EmbeddedAuthor>.from(
                json["author"]!.map((x) => EmbeddedAuthor.fromJson(x))),
        wpFeaturedmedia: json["wp:featuredmedia"] == null
            ? []
            : List<WpFeaturedmedia>.from(json["wp:featuredmedia"]!
                .map((x) => WpFeaturedmedia.fromJson(x))),
        wpTerm: json["wp:term"] == null
            ? []
            : List<List<EmbeddedWpTerm>>.from(json["wp:term"]!.map((x) =>
                List<EmbeddedWpTerm>.from(
                    x.map((x) => EmbeddedWpTerm.fromJson(x))))),
      );

  Map<String, dynamic> toJson() => {
        "author": author == null
            ? []
            : List<dynamic>.from(author!.map((x) => x.toJson())),
        "wp:featuredmedia": List<dynamic>.from(wpFeaturedmedia.map((x) => x.toJson())),
        "wp:term": wpTerm == null
            ? []
            : List<dynamic>.from(wpTerm!
                .map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
      };
}

class EmbeddedWpTerm {
  EmbeddedWpTerm({
    this.id,
    this.link,
    this.name,
    this.slug,
    this.taxonomy,
    this.links,
  });

  final int? id;
  final String? link;
  final String? name;
  final String? slug;
  final String? taxonomy;
  final WpTermLinks? links;

  factory EmbeddedWpTerm.fromRawJson(String str) =>
      EmbeddedWpTerm.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory EmbeddedWpTerm.fromJson(Map<String, dynamic> json) => EmbeddedWpTerm(
        id: json["id"],
        link: json["link"],
        name: json["name"],
        slug: json["slug"],
        taxonomy: json["taxonomy"],
        links: json["_links"] == null
            ? null
            : WpTermLinks.fromJson(json["_links"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "link": link,
        "name": name,
        "slug": slug,
        "taxonomy": taxonomy,
        "_links": links?.toJson(),
      };
}

class WpTermLinks {
  WpTermLinks({
    this.self,
    this.collection,
    this.about,
    this.wpPostType,
    this.curies,
  });

  final List<About>? self;
  final List<About>? collection;
  final List<About>? about;
  final List<About>? wpPostType;
  final List<Cury>? curies;

  factory WpTermLinks.fromRawJson(String str) =>
      WpTermLinks.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory WpTermLinks.fromJson(Map<String, dynamic> json) => WpTermLinks(
        self: json["self"] == null
            ? []
            : List<About>.from(json["self"]!.map((x) => About.fromJson(x))),
        collection: json["collection"] == null
            ? []
            : List<About>.from(
                json["collection"]!.map((x) => About.fromJson(x))),
        about: json["about"] == null
            ? []
            : List<About>.from(json["about"]!.map((x) => About.fromJson(x))),
        wpPostType: json["wp:post_type"] == null
            ? []
            : List<About>.from(
                json["wp:post_type"]!.map((x) => About.fromJson(x))),
        curies: json["curies"] == null
            ? []
            : List<Cury>.from(json["curies"]!.map((x) => Cury.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "self": self == null
            ? []
            : List<dynamic>.from(self!.map((x) => x.toJson())),
        "collection": collection == null
            ? []
            : List<dynamic>.from(collection!.map((x) => x.toJson())),
        "about": about == null
            ? []
            : List<dynamic>.from(about!.map((x) => x.toJson())),
        "wp:post_type": wpPostType == null
            ? []
            : List<dynamic>.from(wpPostType!.map((x) => x.toJson())),
        "curies": curies == null
            ? []
            : List<dynamic>.from(curies!.map((x) => x.toJson())),
      };
}

class WpFeaturedmedia {
  WpFeaturedmedia({
    this.id,
    this.date,
    this.slug,
    this.type,
    required this.link,
    this.title,
    this.author,
    this.caption,
    this.altText,
    this.mediaType,
    this.mimeType,
    this.mediaDetails,
    this.sourceUrl,
    this.links,
  });

  final int? id;
  final DateTime? date;
  final String? slug;
  final String? type;
  final String link;
  final Guid? title;
  final int? author;
  final Guid? caption;
  final String? altText;
  final String? mediaType;
  final String? mimeType;
  final MediaDetails? mediaDetails;
  final String? sourceUrl;
  final WpFeaturedmediaLinks? links;

  factory WpFeaturedmedia.fromRawJson(String str) =>
      WpFeaturedmedia.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory WpFeaturedmedia.fromJson(Map<String, dynamic> json) =>
      WpFeaturedmedia(
        id: json["id"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        slug: json["slug"],
        type: json["type"],
        link: json["link"],
        title: json["title"] == null ? null : Guid.fromJson(json["title"]),
        author: json["author"],
        caption:
            json["caption"] == null ? null : Guid.fromJson(json["caption"]),
        altText: json["alt_text"],
        mediaType: json["media_type"],
        mimeType: json["mime_type"],
        mediaDetails: json["media_details"] == null
            ? null
            : MediaDetails.fromJson(json["media_details"]),
        sourceUrl: json["source_url"],
        links: json["_links"] == null
            ? null
            : WpFeaturedmediaLinks.fromJson(json["_links"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date": date?.toIso8601String(),
        "slug": slug,
        "type": type,
        "link": link,
        "title": title?.toJson(),
        "author": author,
        "caption": caption?.toJson(),
        "alt_text": altText,
        "media_type": mediaType,
        "mime_type": mimeType,
        "media_details": mediaDetails?.toJson(),
        "source_url": sourceUrl,
        "_links": links?.toJson(),
      };
}

class WpFeaturedmediaLinks {
  WpFeaturedmediaLinks({
    this.self,
    this.collection,
    this.about,
    this.author,
    this.replies,
  });

  final List<About>? self;
  final List<About>? collection;
  final List<About>? about;
  final List<ReplyElement>? author;
  final List<ReplyElement>? replies;

  factory WpFeaturedmediaLinks.fromRawJson(String str) =>
      WpFeaturedmediaLinks.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory WpFeaturedmediaLinks.fromJson(Map<String, dynamic> json) =>
      WpFeaturedmediaLinks(
        self: json["self"] == null
            ? []
            : List<About>.from(json["self"]!.map((x) => About.fromJson(x))),
        collection: json["collection"] == null
            ? []
            : List<About>.from(
                json["collection"]!.map((x) => About.fromJson(x))),
        about: json["about"] == null
            ? []
            : List<About>.from(json["about"]!.map((x) => About.fromJson(x))),
        author: json["author"] == null
            ? []
            : List<ReplyElement>.from(
                json["author"]!.map((x) => ReplyElement.fromJson(x))),
        replies: json["replies"] == null
            ? []
            : List<ReplyElement>.from(
                json["replies"]!.map((x) => ReplyElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "self": self == null
            ? []
            : List<dynamic>.from(self!.map((x) => x.toJson())),
        "collection": collection == null
            ? []
            : List<dynamic>.from(collection!.map((x) => x.toJson())),
        "about": about == null
            ? []
            : List<dynamic>.from(about!.map((x) => x.toJson())),
        "author": author == null
            ? []
            : List<dynamic>.from(author!.map((x) => x.toJson())),
        "replies": replies == null
            ? []
            : List<dynamic>.from(replies!.map((x) => x.toJson())),
      };
}

class ReplyElement {
  ReplyElement({
    this.embeddable,
    this.href,
  });

  final bool? embeddable;
  final String? href;

  factory ReplyElement.fromRawJson(String str) =>
      ReplyElement.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ReplyElement.fromJson(Map<String, dynamic> json) => ReplyElement(
        embeddable: json["embeddable"],
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "embeddable": embeddable,
        "href": href,
      };
}

class MediaDetails {
  MediaDetails({
    this.width,
    this.height,
    this.file,
    this.filesize,
    this.sizes,
    this.imageMeta,
  });

  final int? width;
  final int? height;
  final String? file;
  final int? filesize;
  final Sizes? sizes;
  final ImageMeta? imageMeta;

  factory MediaDetails.fromRawJson(String str) =>
      MediaDetails.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MediaDetails.fromJson(Map<String, dynamic> json) => MediaDetails(
        width: json["width"],
        height: json["height"],
        file: json["file"],
        filesize: json["filesize"],
        sizes: json["sizes"] == null ? null : Sizes.fromJson(json["sizes"]),
        imageMeta: json["image_meta"] == null
            ? null
            : ImageMeta.fromJson(json["image_meta"]),
      );

  Map<String, dynamic> toJson() => {
        "width": width,
        "height": height,
        "file": file,
        "filesize": filesize,
        "sizes": sizes?.toJson(),
        "image_meta": imageMeta?.toJson(),
      };
}

class ImageMeta {
  ImageMeta({
    this.aperture,
    this.credit,
    this.camera,
    this.caption,
    this.createdTimestamp,
    this.copyright,
    this.focalLength,
    this.iso,
    this.shutterSpeed,
    this.title,
    this.orientation,
    this.keywords,
  });

  final String? aperture;
  final String? credit;
  final String? camera;
  final String? caption;
  final String? createdTimestamp;
  final String? copyright;
  final String? focalLength;
  final String? iso;
  final String? shutterSpeed;
  final String? title;
  final String? orientation;
  final List<dynamic>? keywords;

  factory ImageMeta.fromRawJson(String str) =>
      ImageMeta.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ImageMeta.fromJson(Map<String, dynamic> json) => ImageMeta(
        aperture: json["aperture"],
        credit: json["credit"],
        camera: json["camera"],
        caption: json["caption"],
        createdTimestamp: json["created_timestamp"],
        copyright: json["copyright"],
        focalLength: json["focal_length"],
        iso: json["iso"],
        shutterSpeed: json["shutter_speed"],
        title: json["title"],
        orientation: json["orientation"],
        keywords: json["keywords"] == null
            ? []
            : List<dynamic>.from(json["keywords"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "aperture": aperture,
        "credit": credit,
        "camera": camera,
        "caption": caption,
        "created_timestamp": createdTimestamp,
        "copyright": copyright,
        "focal_length": focalLength,
        "iso": iso,
        "shutter_speed": shutterSpeed,
        "title": title,
        "orientation": orientation,
        "keywords":
            keywords == null ? [] : List<dynamic>.from(keywords!.map((x) => x)),
      };
}

class Sizes {
  Sizes({
    this.medium,
    this.thumbnail,
    this.mediumLarge,
    this.full,
  });

  final Full? medium;
  final Full? thumbnail;
  final Full? mediumLarge;
  final Full? full;

  factory Sizes.fromRawJson(String str) => Sizes.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Sizes.fromJson(Map<String, dynamic> json) => Sizes(
        medium: json["medium"] == null ? null : Full.fromJson(json["medium"]),
        thumbnail:
            json["thumbnail"] == null ? null : Full.fromJson(json["thumbnail"]),
        mediumLarge: json["medium_large"] == null
            ? null
            : Full.fromJson(json["medium_large"]),
        full: json["full"] == null ? null : Full.fromJson(json["full"]),
      );

  Map<String, dynamic> toJson() => {
        "medium": medium?.toJson(),
        "thumbnail": thumbnail?.toJson(),
        "medium_large": mediumLarge?.toJson(),
        "full": full?.toJson(),
      };
}

class Full {
  Full({
    this.file,
    this.width,
    this.height,
    this.mimeType,
    this.sourceUrl,
    this.filesize,
  });

  final String? file;
  final int? width;
  final int? height;
  final String? mimeType;
  final String? sourceUrl;
  final int? filesize;

  factory Full.fromRawJson(String str) => Full.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Full.fromJson(Map<String, dynamic> json) => Full(
        file: json["file"],
        width: json["width"],
        height: json["height"],
        mimeType: json["mime_type"],
        sourceUrl: json["source_url"],
        filesize: json["filesize"],
      );

  Map<String, dynamic> toJson() => {
        "file": file,
        "width": width,
        "height": height,
        "mime_type": mimeType,
        "source_url": sourceUrl,
        "filesize": filesize,
      };
}

class EmbeddedAuthor {
  EmbeddedAuthor({
    this.id,
    this.name,
    this.url,
    this.description,
    this.link,
    this.slug,
    this.avatarUrls,
    this.links,
  });

  final int? id;
  final String? name;
  final String? url;
  final String? description;
  final String? link;
  final String? slug;
  final Map<String, String>? avatarUrls;
  final AuthorLinks? links;

  factory EmbeddedAuthor.fromRawJson(String str) =>
      EmbeddedAuthor.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory EmbeddedAuthor.fromJson(Map<String, dynamic> json) => EmbeddedAuthor(
        id: json["id"],
        name: json["name"],
        url: json["url"],
        description: json["description"],
        link: json["link"],
        slug: json["slug"],
        avatarUrls: Map.from(json["avatar_urls"]!)
            .map((k, v) => MapEntry<String, String>(k, v)),
        links: json["_links"] == null
            ? null
            : AuthorLinks.fromJson(json["_links"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "url": url,
        "description": description,
        "link": link,
        "slug": slug,
        "avatar_urls": Map.from(avatarUrls!)
            .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "_links": links?.toJson(),
      };
}

class AuthorLinks {
  AuthorLinks({
    this.self,
    this.collection,
  });

  final List<About>? self;
  final List<About>? collection;

  factory AuthorLinks.fromRawJson(String str) =>
      AuthorLinks.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AuthorLinks.fromJson(Map<String, dynamic> json) => AuthorLinks(
        self: json["self"] == null
            ? []
            : List<About>.from(json["self"]!.map((x) => About.fromJson(x))),
        collection: json["collection"] == null
            ? []
            : List<About>.from(
                json["collection"]!.map((x) => About.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "self": self == null
            ? []
            : List<dynamic>.from(self!.map((x) => x.toJson())),
        "collection": collection == null
            ? []
            : List<dynamic>.from(collection!.map((x) => x.toJson())),
      };
}

class Content {
  Content({
    required this.rendered,
    this.protected,
  });

  final String rendered;
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
    required this.rendered,
  });

  final String rendered;

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
    this.wpAttachment,
    this.wpTerm,
    this.curies,
  });

  final List<About>? self;
  final List<About>? collection;
  final List<About>? about;
  final List<AuthorElement>? author;
  final List<AuthorElement>? replies;
  final List<VersionHistory>? versionHistory;
  final List<About>? wpAttachment;
  final List<WpTerm>? wpTerm;
  final List<Cury>? curies;

  factory Links.fromRawJson(String str) => Links.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: json["self"] == null
            ? []
            : List<About>.from(json["self"]!.map((x) => About.fromJson(x))),
        collection: json["collection"] == null
            ? []
            : List<About>.from(
                json["collection"]!.map((x) => About.fromJson(x))),
        about: json["about"] == null
            ? []
            : List<About>.from(json["about"]!.map((x) => About.fromJson(x))),
        author: json["author"] == null
            ? []
            : List<AuthorElement>.from(
                json["author"]!.map((x) => AuthorElement.fromJson(x))),
        replies: json["replies"] == null
            ? []
            : List<AuthorElement>.from(
                json["replies"]!.map((x) => AuthorElement.fromJson(x))),
        versionHistory: json["version-history"] == null
            ? []
            : List<VersionHistory>.from(json["version-history"]!
                .map((x) => VersionHistory.fromJson(x))),
        wpAttachment: json["wp:attachment"] == null
            ? []
            : List<About>.from(
                json["wp:attachment"]!.map((x) => About.fromJson(x))),
        wpTerm: json["wp:term"] == null
            ? []
            : List<WpTerm>.from(
                json["wp:term"]!.map((x) => WpTerm.fromJson(x))),
        curies: json["curies"] == null
            ? []
            : List<Cury>.from(json["curies"]!.map((x) => Cury.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "self": self == null
            ? []
            : List<dynamic>.from(self!.map((x) => x.toJson())),
        "collection": collection == null
            ? []
            : List<dynamic>.from(collection!.map((x) => x.toJson())),
        "about": about == null
            ? []
            : List<dynamic>.from(about!.map((x) => x.toJson())),
        "author": author == null
            ? []
            : List<dynamic>.from(author!.map((x) => x.toJson())),
        "replies": replies == null
            ? []
            : List<dynamic>.from(replies!.map((x) => x.toJson())),
        "version-history": versionHistory == null
            ? []
            : List<dynamic>.from(versionHistory!.map((x) => x.toJson())),
        "wp:attachment": wpAttachment == null
            ? []
            : List<dynamic>.from(wpAttachment!.map((x) => x.toJson())),
        "wp:term": wpTerm == null
            ? []
            : List<dynamic>.from(wpTerm!.map((x) => x.toJson())),
        "curies": curies == null
            ? []
            : List<dynamic>.from(curies!.map((x) => x.toJson())),
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

class AuthorElement {
  AuthorElement({
    this.embeddable,
    this.href,
  });

  final bool? embeddable;
  final String? href;

  factory AuthorElement.fromRawJson(String str) =>
      AuthorElement.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AuthorElement.fromJson(Map<String, dynamic> json) => AuthorElement(
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

class VersionHistory {
  VersionHistory({
    this.count,
    this.href,
  });

  final int? count;
  final String? href;

  factory VersionHistory.fromRawJson(String str) =>
      VersionHistory.fromJson(json.decode(str));

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

class WpTerm {
  WpTerm({
    this.taxonomy,
    this.embeddable,
    this.href,
  });

  final String? taxonomy;
  final bool? embeddable;
  final String? href;

  factory WpTerm.fromRawJson(String str) => WpTerm.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory WpTerm.fromJson(Map<String, dynamic> json) => WpTerm(
        taxonomy: json["taxonomy"],
        embeddable: json["embeddable"],
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "taxonomy": taxonomy,
        "embeddable": embeddable,
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
        astBreadcrumbsContent: json["ast-breadcrumbs-xf"],
        astFeaturedImg: json["ast-featured-img"],
        footerSmlLayout: json["footer-sml-layout"],
        themeTransparentHeaderMeta: json["theme-transparent-header-meta"],
        advHeaderIdMeta: json["adv-header-id-meta"],
        stickHeaderMeta: json["stick-header-meta"],
        headerAboveStickMeta: json["header-above-stick-meta"],
        headerMainStickMeta: json["header-main-stick-meta"],
        headerBelowStickMeta: json["header-below-stick-meta"],
        joinchat: json["_joinchat"] == null
            ? []
            : List<dynamic>.from(json["_joinchat"]!.map((x) => x)),
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
        "_joinchat":
            joinchat == null ? [] : List<dynamic>.from(joinchat!.map((x) => x)),
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
    this.articlePublishedTime,
    this.author,
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
  final DateTime? articlePublishedTime;
  final String? author;
  final String? twitterCard;
  final Schema? schema;

  factory YoastHeadJson.fromRawJson(String str) =>
      YoastHeadJson.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory YoastHeadJson.fromJson(Map<String, dynamic> json) => YoastHeadJson(
        title: json["title"],
        robots: json["robots"] == null ? null : Robots.fromJson(json["robots"]),
        canonical: json["canonical"],
        ogLocale: json["og_locale"],
        ogType: json["og_type"],
        ogTitle: json["og_title"],
        ogDescription: json["og_description"],
        ogUrl: json["og_url"],
        ogSiteName: json["og_site_name"],
        articlePublishedTime: json["article_published_time"] == null
            ? null
            : DateTime.parse(json["article_published_time"]),
        author: json["author"],
        twitterCard: json["twitter_card"],
        schema: json["schema"] == null ? null : Schema.fromJson(json["schema"]),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "robots": robots?.toJson(),
        "canonical": canonical,
        "og_locale": ogLocale,
        "og_type": ogType,
        "og_title": ogTitle,
        "og_description": ogDescription,
        "og_url": ogUrl,
        "og_site_name": ogSiteName,
        "article_published_time": articlePublishedTime?.toIso8601String(),
        "author": author,
        "twitter_card": twitterCard,
        "schema": schema?.toJson(),
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
  final List<Graph>? graph;

  factory Schema.fromRawJson(String str) => Schema.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Schema.fromJson(Map<String, dynamic> json) => Schema(
        context: json["@context"],
        graph: json["@graph"] == null
            ? []
            : List<Graph>.from(json["@graph"]!.map((x) => Graph.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "@context": context,
        "@graph": graph == null
            ? []
            : List<dynamic>.from(graph!.map((x) => x.toJson())),
      };
}

class Graph {
  Graph({
    this.type,
    this.id,
    this.isPartOf,
    this.author,
    this.headline,
    this.datePublished,
    this.dateModified,
    this.mainEntityOfPage,
    this.wordCount,
    this.commentCount,
    this.publisher,
    this.articleSection,
    this.inLanguage,
    this.potentialAction,
    this.url,
    this.name,
    this.breadcrumb,
    this.itemListElement,
    this.description,
    this.logo,
    this.image,
    this.sameAs,
  });

  final String? type;
  final String? id;
  final Breadcrumb? isPartOf;
  final GraphAuthor? author;
  final String? headline;
  final DateTime? datePublished;
  final DateTime? dateModified;
  final Breadcrumb? mainEntityOfPage;
  final int? wordCount;
  final int? commentCount;
  final Breadcrumb? publisher;
  final List<String>? articleSection;
  final String? inLanguage;
  final List<PotentialAction>? potentialAction;
  final String? url;
  final String? name;
  final Breadcrumb? breadcrumb;
  final List<ItemListElement>? itemListElement;
  final String? description;
  final PostImage? logo;
  final PostImage? image;
  final List<String>? sameAs;

  factory Graph.fromRawJson(String str) => Graph.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Graph.fromJson(Map<String, dynamic> json) => Graph(
        type: json["@type"],
        id: json["@id"],
        isPartOf: json["isPartOf"] == null
            ? null
            : Breadcrumb.fromJson(json["isPartOf"]),
        author: json["author"] == null
            ? null
            : GraphAuthor.fromJson(json["author"]),
        headline: json["headline"],
        datePublished: json["datePublished"] == null
            ? null
            : DateTime.parse(json["datePublished"]),
        dateModified: json["dateModified"] == null
            ? null
            : DateTime.parse(json["dateModified"]),
        mainEntityOfPage: json["mainEntityOfPage"] == null
            ? null
            : Breadcrumb.fromJson(json["mainEntityOfPage"]),
        wordCount: json["wordCount"],
        commentCount: json["commentCount"],
        publisher: json["publisher"] == null
            ? null
            : Breadcrumb.fromJson(json["publisher"]),
        articleSection: json["articleSection"] == null
            ? []
            : List<String>.from(json["articleSection"]!.map((x) => x)),
        inLanguage: json["inLanguage"],
        potentialAction: json["potentialAction"] == null
            ? []
            : List<PotentialAction>.from(json["potentialAction"]!
                .map((x) => PotentialAction.fromJson(x))),
        url: json["url"],
        name: json["name"],
        breadcrumb: json["breadcrumb"] == null
            ? null
            : Breadcrumb.fromJson(json["breadcrumb"]),
        itemListElement: json["itemListElement"] == null
            ? []
            : List<ItemListElement>.from(json["itemListElement"]!
                .map((x) => ItemListElement.fromJson(x))),
        description: json["description"],
        logo: json["logo"] == null ? null : PostImage.fromJson(json["logo"]),
        image: json["image"] == null ? null : PostImage.fromJson(json["image"]),
        sameAs: json["sameAs"] == null
            ? []
            : List<String>.from(json["sameAs"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "@type": type,
        "@id": id,
        "isPartOf": isPartOf?.toJson(),
        "author": author?.toJson(),
        "headline": headline,
        "datePublished": datePublished?.toIso8601String(),
        "dateModified": dateModified?.toIso8601String(),
        "mainEntityOfPage": mainEntityOfPage?.toJson(),
        "wordCount": wordCount,
        "commentCount": commentCount,
        "publisher": publisher?.toJson(),
        "articleSection": articleSection == null
            ? []
            : List<dynamic>.from(articleSection!.map((x) => x)),
        "inLanguage": inLanguage,
        "potentialAction": potentialAction == null
            ? []
            : List<dynamic>.from(potentialAction!.map((x) => x.toJson())),
        "url": url,
        "name": name,
        "breadcrumb": breadcrumb?.toJson(),
        "itemListElement": itemListElement == null
            ? []
            : List<dynamic>.from(itemListElement!.map((x) => x.toJson())),
        "description": description,
        "logo": logo?.toJson(),
        "image": image?.toJson(),
        "sameAs":
            sameAs == null ? [] : List<dynamic>.from(sameAs!.map((x) => x)),
      };
}

class GraphAuthor {
  GraphAuthor({
    this.name,
    this.id,
  });

  final String? name;
  final String? id;

  factory GraphAuthor.fromRawJson(String str) =>
      GraphAuthor.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GraphAuthor.fromJson(Map<String, dynamic> json) => GraphAuthor(
        name: json["name"],
        id: json["@id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "@id": id,
      };
}

class Breadcrumb {
  Breadcrumb({
    this.id,
  });

  final String? id;

  factory Breadcrumb.fromRawJson(String str) =>
      Breadcrumb.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Breadcrumb.fromJson(Map<String, dynamic> json) => Breadcrumb(
        id: json["@id"],
      );

  Map<String, dynamic> toJson() => {
        "@id": id,
      };
}

class PostImage {
  PostImage({
    this.id,
    this.type,
    this.inLanguage,
    this.url,
    this.contentUrl,
    this.caption,
    this.width,
    this.height,
  });

  final String? id;
  final String? type;
  final String? inLanguage;
  final String? url;
  final String? contentUrl;
  final String? caption;
  final int? width;
  final int? height;

  factory PostImage.fromRawJson(String str) => PostImage.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PostImage.fromJson(Map<String, dynamic> json) => PostImage(
        id: json["@id"],
        type: json["@type"],
        inLanguage: json["inLanguage"],
        url: json["url"],
        contentUrl: json["contentUrl"],
        caption: json["caption"],
        width: json["width"],
        height: json["height"],
      );

  Map<String, dynamic> toJson() => {
        "@id": id,
        "@type": type,
        "inLanguage": inLanguage,
        "url": url,
        "contentUrl": contentUrl,
        "caption": caption,
        "width": width,
        "height": height,
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

  factory ItemListElement.fromRawJson(String str) =>
      ItemListElement.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ItemListElement.fromJson(Map<String, dynamic> json) =>
      ItemListElement(
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

class PotentialAction {
  PotentialAction({
    this.type,
    this.name,
    this.target,
    this.queryInput,
  });

  final String? type;
  final String? name;
  final dynamic target;
  final String? queryInput;

  factory PotentialAction.fromRawJson(String str) =>
      PotentialAction.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PotentialAction.fromJson(Map<String, dynamic> json) =>
      PotentialAction(
        type: json["@type"],
        name: json["name"],
        target: json["target"],
        queryInput: json["query-input"],
      );

  Map<String, dynamic> toJson() => {
        "@type": type,
        "name": name,
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

  factory TargetClass.fromRawJson(String str) =>
      TargetClass.fromJson(json.decode(str));

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
