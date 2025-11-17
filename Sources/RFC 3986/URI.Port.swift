import Foundation

// MARK: - URI Port

extension RFC_3986.URI {
    /// URI port component per RFC 3986 Section 3.2.3
    ///
    /// The port subcomponent of authority is designated by an optional decimal port number.
    ///
    /// ## Example
    /// ```swift
    /// let port = RFC_3986.URI.Port(8080)
    /// print(port.value) // 8080
    ///
    /// // Common ports
    /// let http = RFC_3986.URI.Port.http  // 80
    /// let https = RFC_3986.URI.Port.https  // 443
    /// ```
    ///
    /// ## RFC 3986 Reference
    /// ```
    /// port = *DIGIT
    /// ```
    public struct Port: Sendable, Equatable, Hashable {
        /// The port number (0-65535)
        public let value: UInt16

        /// Creates a port from a 16-bit unsigned integer
        ///
        /// - Parameter value: The port number (0-65535)
        public init(_ value: UInt16) {
            self.value = value
        }

        /// Creates a port from a string representation
        ///
        /// - Parameter string: The port as a string (e.g., "8080")
        /// - Returns: A Port if the string is a valid port number, nil otherwise
        public init?(_ string: String) {
            guard let port = UInt16(string) else { return nil }
            self.init(port)
        }

        // MARK: - Common Ports

        /// HTTP default port (80)
        public static let http = Port(80)

        /// HTTPS default port (443)
        public static let https = Port(443)

        /// FTP default port (21)
        public static let ftp = Port(21)

        /// FTPS default port (990)
        public static let ftps = Port(990)

        /// SSH default port (22)
        public static let ssh = Port(22)

        /// Telnet default port (23)
        public static let telnet = Port(23)

        /// SMTP default port (25)
        public static let smtp = Port(25)

        /// DNS default port (53)
        public static let dns = Port(53)

        /// DHCP server default port (67)
        public static let dhcpServer = Port(67)

        /// DHCP client default port (68)
        public static let dhcpClient = Port(68)

        /// POP3 default port (110)
        public static let pop3 = Port(110)

        /// IMAP default port (143)
        public static let imap = Port(143)

        /// SNMP default port (161)
        public static let snmp = Port(161)

        /// LDAP default port (389)
        public static let ldap = Port(389)

        /// LDAPS default port (636)
        public static let ldaps = Port(636)

        /// MySQL default port (3306)
        public static let mysql = Port(3306)

        /// PostgreSQL default port (5432)
        public static let postgresql = Port(5432)

        /// Redis default port (6379)
        public static let redis = Port(6379)

        /// MongoDB default port (27017)
        public static let mongodb = Port(27017)

        // MARK: - Convenience Properties

        /// Returns true if this is a well-known port (0-1023)
        public var isWellKnown: Bool {
            value < 1024
        }

        /// Returns true if this is a registered port (1024-49151)
        public var isRegistered: Bool {
            value >= 1024 && value < 49152
        }

        /// Returns true if this is a dynamic/private port (49152-65535)
        public var isDynamic: Bool {
            value >= 49152
        }
    }
}

// MARK: - ExpressibleByIntegerLiteral

extension RFC_3986.URI.Port: ExpressibleByIntegerLiteral {
    /// Creates a port from an integer literal
    ///
    /// Example:
    /// ```swift
    /// let port: RFC_3986.URI.Port = 8080
    /// ```
    public init(integerLiteral value: UInt16) {
        self.init(value)
    }
}

// MARK: - CustomStringConvertible

extension RFC_3986.URI.Port: CustomStringConvertible {
    public var description: String {
        String(value)
    }
}

// MARK: - Codable

extension RFC_3986.URI.Port: Codable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let value = try container.decode(UInt16.self)
        self.init(value)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}

// MARK: - Comparable

extension RFC_3986.URI.Port: Comparable {
    public static func < (lhs: RFC_3986.URI.Port, rhs: RFC_3986.URI.Port) -> Bool {
        lhs.value < rhs.value
    }
}

// MARK: - RawRepresentable

extension RFC_3986.URI.Port: RawRepresentable {
    public var rawValue: UInt16 {
        value
    }

    public init?(rawValue: UInt16) {
        self.init(rawValue)
    }
}
