// Set<Character>.swift
// swift-rfc-3986
//
// Convenience extensions for RFC 3986 character sets

extension Set where Element == Character {
    /// Namespace for URI character sets per RFC 3986
    ///
    /// Usage: `let allowed: Set<Character> = .uri.unreserved`
    public static var uri: URI.Type {
        URI.self
    }

    public enum URI {
        /// Unreserved characters per RFC 3986 Section 2.3
        ///
        /// Characters that can appear unencoded in URIs: `A-Z a-z 0-9 - . _ ~`
        public static var unreserved: Set<Character> {
            RFC_3986.CharacterSets.unreserved
        }

        /// Reserved characters per RFC 3986 Section 2.2
        ///
        /// Characters that serve as delimiters in URIs: `: / ? # [ ] @ ! $ & ' ( ) * + , ; =`
        public static var reserved: Set<Character> {
            RFC_3986.CharacterSets.reserved
        }

        /// General delimiters (subset of reserved) per RFC 3986 Section 2.2
        ///
        /// Characters: `: / ? # [ ] @`
        public static var generalDelimiters: Set<Character> {
            RFC_3986.CharacterSets.genDelims
        }

        /// Sub-delimiters (subset of reserved) per RFC 3986 Section 2.2
        ///
        /// Characters: `! $ & ' ( ) * + , ; =`
        public static var subDelimiters: Set<Character> {
            RFC_3986.CharacterSets.subDelims
        }

        /// Characters allowed in a URI scheme per RFC 3986 Section 3.1
        ///
        /// Scheme names consist of letters, digits, plus (`+`), period (`.`), or hyphen (`-`)
        public static var schemeAllowed: Set<Character> {
            RFC_3986.CharacterSets.scheme
        }

        /// Characters allowed in userinfo per RFC 3986 Section 3.2.1
        ///
        /// Userinfo may consist of unreserved characters, percent-encoded octets,
        /// and sub-delimiters, plus the colon (`:`) character
        public static var userInfoAllowed: Set<Character> {
            RFC_3986.CharacterSets.userinfo
        }

        /// Characters allowed in host (reg-name) per RFC 3986 Section 3.2.2
        ///
        /// A registered name may consist of unreserved characters,
        /// percent-encoded octets, and sub-delimiters
        public static var hostAllowed: Set<Character> {
            RFC_3986.CharacterSets.host
        }

        /// Characters allowed in path segments per RFC 3986 Section 3.3
        ///
        /// Path characters include unreserved, sub-delimiters, and `:` and `@`
        public static var pathSegmentAllowed: Set<Character> {
            RFC_3986.CharacterSets.pathSegment
        }

        /// Characters allowed in query per RFC 3986 Section 3.4
        ///
        /// Query characters include path segment characters plus `/` and `?`
        public static var queryAllowed: Set<Character> {
            RFC_3986.CharacterSets.query
        }

        /// Characters allowed in fragment per RFC 3986 Section 3.5
        ///
        /// Fragment characters are the same as query characters
        public static var fragmentAllowed: Set<Character> {
            RFC_3986.CharacterSets.fragment
        }
    }
}
