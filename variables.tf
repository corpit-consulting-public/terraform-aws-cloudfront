variable "aliases" {
  type        = string
  description = "Extra CNAMEs (alternative domain names), if any, for this distribution."
  default     = ""
}

variable "comment" {
  type        = string
  description = "Any comments you want to include about  the distribution."
  default     = ""
}

variable "customer_error_response" {
  type = list(string)

  # http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/custom-error-pages.html#custom-error-pages-procedure
  # https://www.terraform.io/docs/providers/aws/r/cloudfront_distribution.html#custom-error-response-arguments
  description = "(Optional) - List of one or more custom error response element maps"
  default     = []
}

variable "default_cache_behavior" {
  type        = map(string)
  description = "The default_cache_behavior for this distribution (maximun one)"
  default     = {}
}

variable "default_root_object" {
  type        = string
  description = "The object that you want CloudFront to return (for example, index.html)"
  default     = "index.html"
}

variable "enabled" {
  type        = string
  description = "Whether the distribution is enabled to accept and user request for content"
  default     = ""
}

variable "is_ipv6_enabled" {
  type        = bool
  description = "Whether the IPv6 is enabled for the distribution"
  default     = "true"
}

variable "http_version" {
  type        = string
  description = "The maximun HTTP version to support on the distribution. Allowed values are http1.1 and http2. The defaukt is http2."
  default     = "http2"
}

variable "loggin_config" {
  type        = map(string)
  description = "The logging configuration that controls how longs are written to your distribution (maximun one)"
  default     = {}
}

variable "ordered_cache_behavior" {
  type        = list(string)
  description = "An ordered list of cache behaviors resources for this distribution. List from top to bottom in order of precedence. The topmost cahce behavior will have precedence 0."
  default     = []
}

variable "origin" {
  type        = map(string)
  description = "One or more origins for this distribution (multiples allowed)"
  default     = {}
}

variable "origin_group" {
  type        = map(string)
  description = "One or more origin_group for this distribution (multiples allowed)"
  default     = {}
}

variable "price_class" {
  type        = string
  description = "The price class for this distribution. One of PriceClass_All, PriceClass_200, PriceClass_100"
  default     = "PriceClass_100"
}

variable "restriction" {
  type        = map(string)
  description = "The restriction configuration for this distribution (maximum one)"
  default     = {}
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to assign to the resource"
  default     = {}
}

variable "viewer_certificate" {
  type        = map(string)
  description = "The SSL configuration for this distribution (maximum one)"
  default     = {}
}

variable "web_acl_id" {
  type        = string
  description = "If you're using AWS WAF to filter CloudFront requests, the Id of the AWS WAF web ACL that is associated with the distribution. The WAF Web ACL must exist in the WAF Global (CloudFront) region and the credentials configuring this argument must have waf:GetWebACL permissions assigned. If using WAFv2, provide the ARN of the web ACL."
  default     = ""
}

variable "retain_on_delete" {
  type        = bool
  description = "Disables the distribution intest of deleting in when destroyin the resour through Terraform. if this is set, the distribution needs to be deleted manually afterwards. Defaulr: flase"
  default     = "false"
}

variable "wait_for_deployment" {
  type        = bool
  description = "if enabled, the resource will wait for the distribution status to change from InProgres to Deployed. Setting this to false will skip the process. Default: true"
  default     = "true"
}

##### Variables for Chache Behavior Arguments

variable "allowed_methods" {
  type        = list(string)
  description = "Controls wich HTTP mothods CloudFront processes and forwards to your Amazon S3 bucket or your custom origin. (e.g. ` GET, PUT, POST, DELETE, HEAD`) "
  default     = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
}

variable "cache_methods" {
  type        = list(string)
  description = "Controls whether CloudFront caches the response to request using the specified HTTP methods (e.g. ` GET, PUT, POST, DELETE, HEAD`)"
  default     = ["GET", "HEAD"]
}

variable "compress" {
  type        = bool
  description = "Whether you want CloudFront to automatically compress content for web request that include `Accept-Encoding: gzip` in the request header. Default: false"
  default     = "false"
}

variable "default_ttl" {
  type        = number
  description = "The default amount of time (in seconds) tha an object is in a CloudFront cache before CloudFront fowards another request in the absence of an `Cache-Control max-age` or `Expires` header. Defaults to 1 day"
  default     = "60"
}

variable "field_level_encryption_id" {
  type        = string
  description = "Field level encryptin configuration ID"
  default     = ""
}

# TF-UPGRADE-TODO: Block type was not recognized, so this block and its contents were not automatically upgraded.
variable "forwarded_values" {
  type        = "map"
  description = "The forwarded values configuration that specifies how CloudFront handles query strings, cookies and headers (maximum one)"
  default     = {}
}

variable "lambda_function_association" {
  type        = map(string)
  description = "A config block that triggers a lambda function with specific actions. Define below, maximum 4"
  default     = {}
}

variable "max_ttl" {
  type        = number
  description = "The maximum amount of time (in seconds) that an object is in a CloudFront cache before CloudFront forwards another request to your origin to determine whether the object has been updated. Only effective in the presence of Cache-Control max-age, Cache-Control s-maxage, and Expires headers. Defaults to 365 days."
  default     = "31536000"
}

variable "min_ttl" {
  type        = number
  description = "The minimum amount of time that you want objects to stay in CloudFront caches before CloudFront queries your origin to see whether the object has been updated. Defaults to 0 seconds 0"
  default     = "0"
}

variable "path_pattern" {
  type        = string
  description = "The pattern (for example, `image/*.jpg`) that specifies which request ypou want this cache behavior to apply to"
  default     = ""
}

variable "target_origin_id" {
  type        = string
  description = "The value of ID for the origin that you want CloudFront to route requests to when a request matches the path pattern either for a cache behavior or for the default cache behavior."
  default     = ""
}

variable "viewer_protocol_policy" {
  type        = string
  description = "Use this element to specify the protocol that users can use to access the files in the origin specified by TargetOriginId when a request matches the path pattern in PathPattern. One of allow-all, https-only, or redirect-to-https."
  default     = "redirect-to-https"
}

#####variables for Forwarded Values Arguments

variable "cookies" {
  type        = map(string)
  description = "The forwarded values cookies that specifies how CloudFront handles cookies (maximun one)"
  default     = {}
}

# TF-UPGRADE-TODO: Block type was not recognized, so this block and its contents were not automatically upgraded.
variable "headers" {
  type        = list(string)
  description = "Specifies the Header,  if any, that you want CloudFront to vary upon for this cache behavior. Specify * to include all headers."
  default     = []
}

variable "query_string" {
  type        = bool
  description = "Indicates whether you want CloudFront to forward query strings to the origin that is associated with this cache behavior."
  default     = "false"
}

##### Variables Lambda Function Association
## Lambda@Edge allows you to associate an AWS Lambda Function with a predefined event. You can associate a single function per event type.

variable "event_type" {
  type        = string
  description = "The especific event to trigger this function. Valid values: `viewer-request`, `origin-request`, `viewer-response`, `origin-response`"
  default     = "viewer-request"
}

variable "lambda_arn" {
  type        = string
  description = "ARN of the lamnda function."
  default     = ""
}

variable "include_body" {
  type        = bool
  description = "When set to true it exposes the request body to the lambda function. Defaults to false. Valid values `true or false`"
  default     = "false"
}

###Variables for Cookies

variable "forward" {
  type        = string
  description = "Specifies whether you want CloudFront to forward cookies to the origin that is associated with this cache behavior. You can specify all, none or whitelist. If whitelist, you must include the subsequent whitelisted_names"
  default     = "none"
}

variable "whitelisted_names" {
  type        = list(string)
  description = "If you have specified whitelist to forward, the whitelisted cookies that you want CloudFront to forward to your origin."
  default     = []
}

### Variables for Custom Error Response

variable "error_caching_min_ttl" {
  type        = string
  description = "The minimum amount of time you want HTTP error codes to stay in CloudFront caches before CloudFront queries your origin to see whether the object has been updated."
  default     = ""
}

variable "error_code" {
  type        = string
  description = "The 4xx or 5xx HTTP status code that you want to customize."
  default     = ""
}

variable "response_code" {
  type        = string
  description = "The HTTP status code that you want CloudFront to return with the custom error page to the viewer."
  default     = ""
}

variable "response_page_path" {
  type        = string
  description = "The path of the custom error page (for example, /custom_404.html)."
  default     = ""
}

##### Variable for Default Cache Behavior

##The arguments for default_cache_behavior are the same as for ordered_cache_behavior, except for the path_pattern argument is not required.

#### Variables for Loggin Config 

variable "log_bucket" {
  type        = string
  description = "The Amazon S3 bucket to store the access logs in, for example `myawslogbucket.s3.amazonaws.com`"
  default     = ""
}

variable "log_incude_cookies" {
  type        = bool
  description = "Specifies whether you want CloudFront to include cookies in access logs (default: false)."
  default     = "false"
}

variable "log_prefix" {
  type        = string
  description = "An optional string that you want CloudFront to prefix to the access log filenames for this distribution, for example, myprefix/."
  default     = ""
}

#### Variables for Origins

variable "custom_origin_config" {
  type        = map(string)
  description = "The CloudFront custom origin configuration information. If an S3 origin is required, use s3_origin_config instead."
  default     = {}
}

variable "domain_name" {
  type        = string
  description = "The DNS domain name of either the S3 bucket, or web site of your custom origin."
  default     = ""
}

variable "custom_heaer" {
  type        = string
  description = "One or more sub-resources with name and value parameters that specify header data that will be sent to the origin (multiples allowed)."
  default     = ""
}

variable "origin_id" {
  type        = string
  description = "A unique identifier for the origin"
  default     = ""
}

variable "origin_path" {
  type        = string
  description = "An optional element that causes CloudFront to request your content from a directory in your Amazon S3 bucket or your custom origin."
  default     = ""
}

variable "s3_origin_config" {
  type        = map(string)
  description = "The CloudFront S3 origin configuration information. If a custom origin is required, use custom_origin_config instead."
  default     = {}
}

#### Variables for Origin Config

variable "origin_http_port" {
  type        = string
  description = "The HTTP port the custom origin listens on."
  default     = ""
}

variable "origin_https_port" {
  type        = string
  description = "The HTTPS port the cutom origin listens on"
  default     = ""
}

variable "origin_protocol_policy" {
  type        = string
  description = "The origin protocol policy to apply to your origin. One of http-only, https-only, or match-viewer."
  default     = "match-viewer"
}

variable "origin_ssl_protocols" {
  type        = list(string)
  description = " The SSL/TLS protocols that you want CloudFront to use when communicating with your origin over HTTPS. A list of one or more of SSLv3, TLSv1, TLSv1.1, and TLSv1.2."
  default     = ["TLSv1", "TLSv1.1", "TLSv1.2"]
}

variable "origin_keepalive_timeout" {
  type        = number
  description = "he Custom KeepAlive timeout, in seconds. By default, AWS enforces a limit of 60. But you can request an increase."
  default     = "60"
}

variable "origin_read_timeout" {
  type        = number
  description = "The Custom Read timeout, in seconds. By default, AWS enforces a limit of 60. But you can request an increase."
  default     = "60"
}

#### Variable for S3 Origin Config

variable "origin_access_identity" {
  type        = string
  description = " The CloudFront origin access identity to associate with the origin."
  default     = ""
}

##### Variables for Viewer Certificate

variable "acm_certificate_arn" {
  type        = string
  description = "The ARN of the AWS Certificate Manager certificate that you wish to use with this distribution. Specify this, cloudfront_default_certificate, or iam_certificate_id. The ACM certificate must be in US-EAST-1."
  default     = ""
}

variable "minimum_protocol_version" {
  type        = "string"
  description = "The minimum version of the SSL protocol that you want CloudFront to use for HTTPS connections. Can only be set if cloudfront_default_certificate = false. One of SSLv3, TLSv1, TLSv1_2016, TLSv1.1_2016 or TLSv1.2_2018. Default: TLSv1. NOTE: If you are using a custom certificate (specified with acm_certificate_arn or iam_certificate_id), and have specified sni-only in ssl_support_method, TLSv1 or later must be specified. If you have specified vip in ssl_support_method, only SSLv3 or TLSv1 can be specified. If you have specified cloudfront_default_certificate, TLSv1 must be specified."
  default     = "TLSv1"
}

variable "ssl_support_method" {
  type        = string
  description = " Specifies how you want CloudFront to serve HTTPS requests. One of vip or sni-only. Required if you specify acm_certificate_arn or iam_certificate_id. NOTE: vip causes CloudFront to use a dedicated IP address and may incur extra charges"
  default     = "sni-only"
}

### Variables for Restriction

variable "geo_restriction_locations" {
  type        = list(string)
  description = "The ISO 3166-1-alpha-2 codes for which you want CloudFront either to distribute your content (whitelist) or not distribute your content (blacklist)"
  default     = []
}

variable "geo_restriction_type" {
  type        = string
  description = "The method that you want to use to restrict distribution of your content by country: none, whitelist, or blacklist."
  default     = "none"
}

variable "s3_logs_name" {
  type        = string
  description = "Bucket name for logs"
  default     = ""
}

