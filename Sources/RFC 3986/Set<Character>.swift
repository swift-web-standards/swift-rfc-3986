// Set<Character>.swift
// swift-rfc-3986
//
// Convenience extensions for RFC 3986 character sets

extension Set where Element == Character {
    /// Namespace for URI character sets per RFC 3986
    ///
    /// Provides convenient access to RFC 3986 character sets via `.uri` namespace:
    /// ```swift
    /// let allowed: Set<Character> = .uri.unreserved
    /// let query: Set<Character> = .uri.query
    /// let path: Set<Character> = .uri.pathSegment
    /// ```
    ///
    /// All properties delegate directly to `RFC_3986.CharacterSets`.
    public static var uri: RFC_3986.CharacterSets.Type {
        RFC_3986.CharacterSets.self
    }
}
