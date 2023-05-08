
/// https://discord.com/developers/docs/resources/guild#guild-object-guild-structure
public struct Guild: Sendable, Codable {
    
    /// https://discord.com/developers/docs/resources/guild#guild-member-object-guild-member-structure
    public struct Member: Sendable, Codable {
        
        /// https://discord.com/developers/docs/resources/guild#guild-member-object-guild-member-flags
        public enum Flag: Int, Sendable {
            case didRejoin = 0
            case completedOnboarding = 1
            case bypassVerification = 2
            case startedOnboarding = 3
        }
        
        public var user: DiscordUser?
        public var nick: String?
        public var avatar: String?
        public var roles: [RoleSnowflake]
        public var hoisted_role: String?
        public var joined_at: DiscordTimestamp
        public var premium_since: DiscordTimestamp?
        public var deaf: Bool?
        public var mute: Bool?
        public var pending: Bool?
        public var is_pending: Bool?
        public var flags: IntBitField<Flag>?
        public var permissions: StringBitField<Permission>?
        public var communication_disabled_until: DiscordTimestamp?
        
        public init(guildMemberAdd: Gateway.GuildMemberAdd) {
            self.roles = guildMemberAdd.roles
            self.hoisted_role = guildMemberAdd.hoisted_role
            self.user = guildMemberAdd.user
            self.nick = guildMemberAdd.nick
            self.avatar = guildMemberAdd.avatar
            self.joined_at = guildMemberAdd.joined_at
            self.premium_since = guildMemberAdd.premium_since
            self.deaf = guildMemberAdd.deaf
            self.mute = guildMemberAdd.mute
            self.pending = guildMemberAdd.pending
            self.is_pending = guildMemberAdd.is_pending
            self.flags = guildMemberAdd.flags
            self.permissions = guildMemberAdd.permissions
            self.communication_disabled_until = guildMemberAdd.communication_disabled_until
        }
    }
    
    /// https://discord.com/developers/docs/resources/guild#guild-object-verification-level
    public enum VerificationLevel: Int, Sendable, Codable, ToleratesIntDecodeMarker {
        case none = 0
        case low = 1
        case medium = 2
        case high = 3
        case veryHigh = 4
    }
    
    /// https://discord.com/developers/docs/resources/guild#guild-object-default-message-notification-level
    public enum DefaultMessageNotificationLevel: Int, Sendable, Codable, ToleratesIntDecodeMarker {
        case allMessages = 0
        case onlyMentions = 1
    }
    
    /// https://discord.com/developers/docs/resources/guild#guild-object-explicit-content-filter-level
    public enum ExplicitContentFilterLevel: Int, Sendable, Codable, ToleratesIntDecodeMarker {
        case disabled = 0
        case memberWithoutRoles = 1
        case allMembers = 2
    }
    
    /// https://discord.com/developers/docs/resources/guild#guild-object-guild-features
    public enum Feature: String, Sendable, Codable, ToleratesStringDecodeMarker {
        case animatedBanner = "ANIMATED_BANNER"
        case animatedIcon = "ANIMATED_ICON"
        case applicationCommandPermissionsV2 = "APPLICATION_COMMAND_PERMISSIONS_V2"
        case autoModeration = "AUTO_MODERATION"
        case banner = "BANNER"
        case community = "COMMUNITY"
        case creatorMonetizableProvisional = "CREATOR_MONETIZABLE_PROVISIONAL"
        case creatorStorePage = "CREATOR_STORE_PAGE"
        case developerSupportServer = "DEVELOPER_SUPPORT_SERVER"
        case discoverable = "DISCOVERABLE"
        case featurable = "FEATURABLE"
        case invitesDisabled = "INVITES_DISABLED"
        case inviteSplash = "INVITE_SPLASH"
        case memberVerificationGateEnabled = "MEMBER_VERIFICATION_GATE_ENABLED"
        case moreStickers = "MORE_STICKERS"
        case news = "NEWS"
        case partnered = "PARTNERED"
        case previewEnabled = "PREVIEW_ENABLED"
        case raidAlertsDisabled = "RAID_ALERTS_DISABLED"
        case roleIcons = "ROLE_ICONS"
        case roleSubscriptionsAvailableForPurchase = "ROLE_SUBSCRIPTIONS_AVAILABLE_FOR_PURCHASE"
        case roleSubscriptionsEnabled = "ROLE_SUBSCRIPTIONS_ENABLED"
        case ticketedEventsEnabled = "TICKETED_EVENTS_ENABLED"
        case vanityURL = "VANITY_URL"
        case verified = "VERIFIED"
        case vipRegions = "VIP_REGIONS"
        case welcomeScreenEnabled = "WELCOME_SCREEN_ENABLED"

        /// These ones are not mentioned in the Discord docs.
        /// Might not even be valid anymore.
//        case commerce = "COMMERCE"
//        case privateThreads = "PRIVATE_THREADS"
//        case sevenDayThreadArchive = "SEVEN_DAY_THREAD_ARCHIVE"
//        case threeDayThreadArchive = "THREE_DAY_THREAD_ARCHIVE"
//        case guildWebPageVanityUrl = "GUILD_WEB_PAGE_VANITY_URL"
//        case textInVoiceEnabled = "TEXT_IN_VOICE_ENABLED"
//        case memberProfiles = "MEMBER_PROFILES"
//        case threadsEnabled = "THREADS_ENABLED"
//        case exposedToActivitiesWtpExperiment = "EXPOSED_TO_ACTIVITIES_WTP_EXPERIMENT"
//        case newThreadPermissions = "NEW_THREAD_PERMISSIONS"
//        case enabledDiscoverableBefore = "ENABLED_DISCOVERABLE_BEFORE"
//        case communityExpMedium = "COMMUNITY_EXP_MEDIUM"
//        case communityExpLargeUngated = "COMMUNITY_EXP_LARGE_UNGATED"
//        case soundboard = "SOUNDBOARD"
//        case monetizationEnabled = "MONETIZATION_ENABLED"
    }
    
    /// https://discord.com/developers/docs/resources/guild#guild-object-mfa-level
    public enum MFALevel: Int, Sendable, Codable, ToleratesIntDecodeMarker {
        case none = 0
        case elevated = 1
    }
    
    /// https://discord.com/developers/docs/resources/guild#guild-object-system-channel-flags
    public enum SystemChannelFlag: Int, Sendable {
        case suppressJoinNotifications = 0
        case suppressPremiumSubscriptions = 1
        case suppressGuildReminderNotifications = 2
        case suppressJoinNotificationReplies = 3
        case suppressRoleSubscriptionPurchaseNotifications = 4
        case suppressRoleSubscriptionPurchaseNotificationReplies = 5
    }
    
    /// https://discord.com/developers/docs/resources/guild#guild-object-premium-tier
    public enum PremiumTier: Int, Sendable, Codable, ToleratesIntDecodeMarker {
        case none = 0
        case tier1 = 1
        case tier2 = 2
        case tier3 = 3
    }
    
    /// https://discord.com/developers/docs/resources/guild#welcome-screen-object-welcome-screen-structure
    public struct WelcomeScreen: Sendable, Codable {
        
        /// https://discord.com/developers/docs/resources/guild#welcome-screen-object-welcome-screen-channel-structure
        public struct Channel: Sendable, Codable {
            public var channel_id: ChannelSnowflake
            public var description: String
            public var emoji_id: EmojiSnowflake?
            public var emoji_name: String?
        }
        
        public var description: String?
        public var welcome_channels: [Channel]
    }
    
    /// https://discord.com/developers/docs/resources/guild#guild-object-guild-nsfw-level
    public enum NSFWLevel: Int, Sendable, Codable, ToleratesIntDecodeMarker {
        case `default` = 0
        case explicit = 1
        case safe = 2
        case ageRestricted = 3
    }

    /// https://discord.com/developers/docs/resources/guild#create-guild-json-params
    public enum AFKTimeout: Int, Sendable, Codable, ToleratesIntDecodeMarker {
        case oneMinute = 60
        case fiveMinutes = 300
        case fifteenMinutes = 900
        case halfAnHour = 1800
        case anHour = 3600
    }
    
    public var id: GuildSnowflake
    public var name: String
    public var icon: String?
    public var icon_hash: String?
    public var splash: String?
    public var discovery_splash: String?
    public var owner: Bool?
    public var owner_id: UserSnowflake
    public var permissions: StringBitField<Permission>?
    public var afk_channel_id: ChannelSnowflake?
    public var afk_timeout: AFKTimeout
    public var widget_enabled: Bool?
    public var widget_channel_id: ChannelSnowflake?
    public var verification_level: VerificationLevel
    public var default_message_notifications: DefaultMessageNotificationLevel
    public var explicit_content_filter: ExplicitContentFilterLevel
    public var roles: [Role]
    public var emojis: [PartialEmoji]
    public var features: [Feature]
    public var mfa_level: MFALevel
    public var application_id: ApplicationSnowflake?
    public var system_channel_id: ChannelSnowflake?
    public var system_channel_flags: IntBitField<SystemChannelFlag>
    public var rules_channel_id: ChannelSnowflake?
    public var safety_alerts_channel_id: ChannelSnowflake?
    public var max_presences: Int?
    public var max_members: Int?
    public var vanity_url_code: String?
    public var description: String?
    public var banner: String?
    public var premium_tier: PremiumTier
    public var premium_subscription_count: Int?
    public var preferred_locale: DiscordLocale
    public var public_updates_channel_id: ChannelSnowflake?
    public var max_video_channel_users: Int?
    public var max_stage_video_channel_users: Int?
    public var approximate_member_count: Int?
    public var approximate_presence_count: Int?
    public var welcome_screen: [WelcomeScreen]?
    public var nsfw_level: NSFWLevel
    public var stickers: [Sticker]?
    public var premium_progress_bar_enabled: Bool
    public var `lazy`: Bool?
    public var hub_type: String?
    public var nsfw: Bool
    public var application_command_counts: [String: Int]?
    public var embedded_activities: [Gateway.Activity]?
    public var version: Int?
    public var guild_id: GuildSnowflake?
}

extension Guild {
    /// A partial ``Guild.Member`` object.
    /// https://discord.com/developers/docs/resources/guild#guild-member-object-guild-member-structure
    public struct PartialMember: Sendable, Codable {
        public var user: DiscordUser?
        public var nick: String?
        public var avatar: String?
        public var roles: [String]?
        public var hoisted_role: String?
        public var joined_at: DiscordTimestamp?
        public var premium_since: DiscordTimestamp?
        public var deaf: Bool?
        public var mute: Bool?
        public var pending: Bool?
        public var is_pending: Bool?
        public var flags: IntBitField<Member.Flag>?
        public var permissions: StringBitField<Permission>?
        public var communication_disabled_until: DiscordTimestamp?
    }
}

/// https://discord.com/developers/docs/resources/guild#guild-object-guild-structure
public struct PartialGuild: Sendable, Codable {
    public var id: GuildSnowflake
    public var name: String?
    public var icon: String?
    public var icon_hash: String?
    public var splash: String?
    public var discovery_splash: String?
    public var owner: Bool?
    public var owner_id: UserSnowflake?
    public var permissions: StringBitField<Permission>?
    public var afk_channel_id: ChannelSnowflake?
    public var afk_timeout: Int?
    public var widget_enabled: Bool?
    public var widget_channel_id: ChannelSnowflake?
    public var verification_level: Guild.VerificationLevel?
    public var default_message_notifications: Guild.DefaultMessageNotificationLevel?
    public var explicit_content_filter: Guild.ExplicitContentFilterLevel?
    public var roles: [Role]?
    public var emojis: [PartialEmoji]?
    public var features: [Guild.Feature]?
    public var mfa_level: Guild.MFALevel?
    public var application_id: ApplicationSnowflake?
    public var system_channel_id: ChannelSnowflake?
    public var system_channel_flags: IntBitField<Guild.SystemChannelFlag>?
    public var rules_channel_id: ChannelSnowflake?
    public var safety_alerts_channel_id: ChannelSnowflake?
    public var max_presences: Int?
    public var max_members: Int?
    public var vanity_url_code: String?
    public var description: String?
    public var banner: String?
    public var premium_tier: Guild.PremiumTier?
    public var premium_subscription_count: Int?
    public var preferred_locale: DiscordLocale?
    public var public_updates_channel_id: ChannelSnowflake?
    public var max_video_channel_users: Int?
    public var max_stage_video_channel_users: Int?
    public var approximate_member_count: Int?
    public var approximate_presence_count: Int?
    public var welcome_screen: [Guild.WelcomeScreen]?
    public var nsfw_level: Guild.NSFWLevel?
    public var stickers: [Sticker]?
    public var premium_progress_bar_enabled: Bool
    public var `lazy`: Bool?
    public var hub_type: String?
    public var nsfw: Bool?
    public var application_command_counts: [String: Int]?
    public var embedded_activities: [Gateway.Activity]?
    public var version: Int?
    public var guild_id: GuildSnowflake?
}

/// https://discord.com/developers/docs/resources/guild#unavailable-guild-object
public struct UnavailableGuild: Sendable, Codable {
    public var id: GuildSnowflake
    public var unavailable: Bool?
}

/// https://discord.com/developers/docs/resources/guild#integration-account-object
public struct IntegrationAccount: Sendable, Codable {
    /// Not a snowflake.
    public var id: String
    public var name: String
}

/// https://discord.com/developers/docs/resources/guild#integration-application-object-integration-application-structure
public struct IntegrationApplication: Sendable, Codable {
    public var id: ApplicationSnowflake
    public var name: String
    public var icon: String?
    public var description: String
    public var bot: DiscordUser?
}
