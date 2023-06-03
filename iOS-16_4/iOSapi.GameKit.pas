{ *********************************************************** }
{ }
{ CodeGear Delphi Runtime Library }
{ }
{ Copyright(c) 2012-2014 Embarcadero Technologies, Inc. }
{ }
{ *********************************************************** }

//
// Delphi-Objective-C Bridge
// Interfaces for Cocoa framework GameKit
//

unit iOSapi.GameKit;

interface

uses
  Macapi.CoreFoundation,
  Macapi.CoreServices,
  Macapi.Dispatch,
  Macapi.Mach,
  Macapi.ObjCRuntime,
  Macapi.ObjectiveC,
  iOSapi.CocoaTypes,
  iOSapi.Foundation,
  iOSapi.UIKit;

const
  GKErrorUnknown = 1;
  GKErrorCancelled = 2;
  GKErrorCommunicationsFailure = 3;
  GKErrorUserDenied = 4;
  GKErrorInvalidCredentials = 5;
  GKErrorNotAuthenticated = 6;
  GKErrorAuthenticationInProgress = 7;
  GKErrorInvalidPlayer = 8;
  GKErrorScoreNotSet = 9;
  GKErrorParentalControlsBlocked = 10;
  GKErrorPlayerStatusExceedsMaximumLength = 11;
  GKErrorPlayerStatusInvalid = 12;
  GKErrorMatchRequestInvalid = 13;
  GKErrorUnderage = 14;
  GKErrorGameUnrecognized = 15;
  GKErrorNotSupported = 16;
  GKErrorInvalidParameter = 17;
  GKErrorUnexpectedConnection = 18;
  GKErrorChallengeInvalid = 19;
  GKErrorTurnBasedMatchDataTooLarge = 20;
  GKErrorTurnBasedTooManySessions = 21;
  GKErrorTurnBasedInvalidParticipant = 22;
  GKErrorTurnBasedInvalidTurn = 23;
  GKErrorTurnBasedInvalidState = 24;
  GKErrorInvitationsDisabled = 25;
  GKErrorPlayerPhotoFailure = 26;
  GKErrorUbiquityContainerUnavailable = 27;
  GKErrorMatchNotConnected = 28;
  GKErrorGameSessionRequestInvalid = 29;
  GKErrorRestrictedToAutomatch = 30;
  GKErrorAPINotAvailable = 31;
  GKErrorNotAuthorized = 32;
  GKErrorConnectionTimeout = 33;
  GKErrorAPIObsolete = 34;
  GKErrorFriendListDescriptionMissing = 100;
  GKErrorFriendListRestricted = 101;
  GKErrorFriendListDenied = 102;
  GKErrorFriendRequestNotAvailable = 103;
  GKPhotoSizeSmall = 0;
  GKPhotoSizeNormal = 1;
  GKLeaderboardTimeScopeToday = 0;
  GKLeaderboardTimeScopeWeek = 1;
  GKLeaderboardTimeScopeAllTime = 2;
  GKLeaderboardPlayerScopeGlobal = 0;
  GKLeaderboardPlayerScopeFriendsOnly = 1;
  GKLeaderboardTypeClassic = 0;
  GKLeaderboardTypeRecurring = 1;
  GKGameCenterViewControllerStateDefault = -1;
  GKGameCenterViewControllerStateLeaderboards = 0;
  GKGameCenterViewControllerStateAchievements = 1;
  GKGameCenterViewControllerStateChallenges = 2;
  GKGameCenterViewControllerStateLocalPlayerProfile = 3;
  GKGameCenterViewControllerStateDashboard = 4;
  GKGameCenterViewControllerStateLocalPlayerFriendsList = 5;
  GKAccessPointLocationTopLeading = 0;
  GKAccessPointLocationTopTrailing = 1;
  GKAccessPointLocationBottomLeading = 2;
  GKAccessPointLocationBottomTrailing = 3;
  GKChallengeStateInvalid = 0;
  GKChallengeStatePending = 1;
  GKChallengeStateCompleted = 2;
  GKChallengeStateDeclined = 3;
  GKConnectionStateNotConnected = 0;
  GKConnectionStateConnected = 1;
  GKTransportTypeUnreliable = 0;
  GKTransportTypeReliable = 1;
  GKGameSessionErrorUnknown = 1;
  GKGameSessionErrorNotAuthenticated = 2;
  GKGameSessionErrorSessionConflict = 3;
  GKGameSessionErrorSessionNotShared = 4;
  GKGameSessionErrorConnectionCancelledByUser = 5;
  GKGameSessionErrorConnectionFailed = 6;
  GKGameSessionErrorSessionHasMaxConnectedPlayers = 7;
  GKGameSessionErrorSendDataNotConnected = 8;
  GKGameSessionErrorSendDataNoRecipients = 9;
  GKGameSessionErrorSendDataNotReachable = 10;
  GKGameSessionErrorSendRateLimitReached = 11;
  GKGameSessionErrorBadContainer = 12;
  GKGameSessionErrorCloudQuotaExceeded = 13;
  GKGameSessionErrorNetworkFailure = 14;
  GKGameSessionErrorCloudDriveDisabled = 15;
  GKGameSessionErrorInvalidSession = 16;
  GKTurnBasedMatchStatusUnknown = 0;
  GKTurnBasedMatchStatusOpen = 1;
  GKTurnBasedMatchStatusEnded = 2;
  GKTurnBasedMatchStatusMatching = 3;
  GKTurnBasedParticipantStatusUnknown = 0;
  GKTurnBasedParticipantStatusInvited = 1;
  GKTurnBasedParticipantStatusDeclined = 2;
  GKTurnBasedParticipantStatusMatching = 3;
  GKTurnBasedParticipantStatusActive = 4;
  GKTurnBasedParticipantStatusDone = 5;
  GKTurnBasedMatchOutcomeNone = 0;
  GKTurnBasedMatchOutcomeQuit = 1;
  GKTurnBasedMatchOutcomeWon = 2;
  GKTurnBasedMatchOutcomeLost = 3;
  GKTurnBasedMatchOutcomeTied = 4;
  GKTurnBasedMatchOutcomeTimeExpired = 5;
  GKTurnBasedMatchOutcomeFirst = 6;
  GKTurnBasedMatchOutcomeSecond = 7;
  GKTurnBasedMatchOutcomeThird = 8;
  GKTurnBasedMatchOutcomeFourth = 9;
  GKTurnBasedMatchOutcomeCustomRange = 16711680;
  GKTurnBasedExchangeStatusUnknown = 0;
  GKTurnBasedExchangeStatusActive = 1;
  GKTurnBasedExchangeStatusComplete = 2;
  GKTurnBasedExchangeStatusResolved = 3;
  GKTurnBasedExchangeStatusCanceled = 4;
  GKInviteRecipientResponseAccepted = 0;
  GKInviteRecipientResponseDeclined = 1;
  GKInviteRecipientResponseFailed = 2;
  GKInviteRecipientResponseIncompatible = 3;
  GKInviteRecipientResponseUnableToConnect = 4;
  GKInviteRecipientResponseNoAnswer = 5;
  GKInviteeResponseAccepted = GKInviteRecipientResponseAccepted;
  GKInviteeResponseDeclined = GKInviteRecipientResponseDeclined;
  GKInviteeResponseFailed = GKInviteRecipientResponseFailed;
  GKInviteeResponseIncompatible = GKInviteRecipientResponseIncompatible;
  GKInviteeResponseUnableToConnect = GKInviteRecipientResponseUnableToConnect;
  GKInviteeResponseNoAnswer = GKInviteRecipientResponseNoAnswer;
  GKMatchTypePeerToPeer = 0;
  GKMatchTypeHosted = 1;
  GKMatchTypeTurnBased = 2;
  GKFriendsAuthorizationStatusNotDetermined = 0;
  GKFriendsAuthorizationStatusRestricted = 1;
  GKFriendsAuthorizationStatusDenied = 2;
  GKFriendsAuthorizationStatusAuthorized = 3;
  GKMatchSendDataReliable = 0;
  GKMatchSendDataUnreliable = 1;
  GKPlayerStateUnknown = 0;
  GKPlayerStateConnected = 1;
  GKPlayerStateDisconnected = 2;
  GKMatchmakingModeDefault = 0;
  GKMatchmakingModeNearbyOnly = 1;
  GKMatchmakingModeAutomatchOnly = 2;
  GKMatchmakingModeInviteOnly = 3;
  GKSendDataReliable = 0;
  GKSendDataUnreliable = 1;
  GKSessionModeServer = 0;
  GKSessionModeClient = 1;
  GKSessionModePeer = 2;
  GKPeerStateAvailable = 0;
  GKPeerStateUnavailable = 1;
  GKPeerStateConnected = 2;
  GKPeerStateDisconnected = 3;
  GKPeerStateConnecting = 4;
  GKPeerStateConnectedRelay = 5;
  GKVoiceChatServiceInternalError = 32000;
  GKVoiceChatServiceNoRemotePacketsError = 32001;
  GKVoiceChatServiceUnableToConnectError = 32002;
  GKVoiceChatServiceRemoteParticipantHangupError = 32003;
  GKVoiceChatServiceInvalidCallIDError = 32004;
  GKVoiceChatServiceAudioUnavailableError = 32005;
  GKVoiceChatServiceUninitializedClientError = 32006;
  GKVoiceChatServiceClientMissingRequiredMethodsError = 32007;
  GKVoiceChatServiceRemoteParticipantBusyError = 32008;
  GKVoiceChatServiceRemoteParticipantCancelledError = 32009;
  GKVoiceChatServiceRemoteParticipantResponseInvalidError = 32010;
  GKVoiceChatServiceRemoteParticipantDeclinedInviteError = 32011;
  GKVoiceChatServiceMethodCurrentlyInvalidError = 32012;
  GKVoiceChatServiceNetworkConfigurationError = 32013;
  GKVoiceChatServiceUnsupportedRemoteVersionError = 32014;
  GKVoiceChatServiceOutOfMemoryError = 32015;
  GKVoiceChatServiceInvalidParameterError = 32016;
  GKPeerPickerConnectionTypeOnline = 1 shl 0;
  GKPeerPickerConnectionTypeNearby = 1 shl 1;
  GKSessionInvalidParameterError = 30500;
  GKSessionPeerNotFoundError = 30501;
  GKSessionDeclinedError = 30502;
  GKSessionTimedOutError = 30503;
  GKSessionCancelledError = 30504;
  GKSessionConnectionFailedError = 30505;
  GKSessionConnectionClosedError = 30506;
  GKSessionDataTooBigError = 30507;
  GKSessionNotConnectedError = 30508;
  GKSessionCannotEnableError = 30509;
  GKSessionInProgressError = 30510;
  GKSessionConnectivityError = 30201;
  GKSessionTransportError = 30202;
  GKSessionInternalError = 30203;
  GKSessionUnknownError = 30204;
  GKSessionSystemError = 30205;
  GKVoiceChatPlayerConnected = 0;
  GKVoiceChatPlayerDisconnected = 1;
  GKVoiceChatPlayerSpeaking = 2;
  GKVoiceChatPlayerSilent = 3;
  GKVoiceChatPlayerConnecting = 4;

type

  // ===== Forward declarations =====
{$M+}
  GKBasePlayer = interface;
  GKLocalPlayer = interface;
  GKPlayer = interface;
  GKScore = interface;
  GKLeaderboardEntry = interface;
  GKLeaderboard = interface;
  GKAchievement = interface;
  GKGameCenterControllerDelegate = interface;
  GKGameCenterViewController = interface;
  GKAccessPoint = interface;
  GKAchievementDescription = interface;
  GKAchievementViewControllerDelegate = interface;
  GKAchievementViewController = interface;
  GKLeaderboardScore = interface;
  GKChallenge = interface;
  GKScoreChallenge = interface;
  GKAchievementChallenge = interface;
  GKChallengeEventHandlerDelegate = interface;
  GKChallengeEventHandler = interface;
  GKCloudPlayer = interface;
  GKChallengeListener = interface;
  GKFriendRequestComposeViewControllerDelegate = interface;
  GKFriendRequestComposeViewController = interface;
  GKGameSession = interface;
  GKGameSessionEventListener = interface;
  GKLeaderboardSet = interface;
  GKLeaderboardViewControllerDelegate = interface;
  GKLeaderboardViewController = interface;
  GKMatchRequest = interface;
  GKTurnBasedMatch = interface;
  GKTurnBasedExchange = interface;
  GKTurnBasedExchangeReply = interface;
  GKTurnBasedParticipant = interface;
  GKTurnBasedEventListener = interface;
  GKTurnBasedEventHandlerDelegate = interface;
  GKTurnBasedEventHandler = interface;
  GKMatch = interface;
  GKInvite = interface;
  GKInviteEventListener = interface;
  GKMatchmaker = interface;
  GKSavedGame = interface;
  GKSavedGameListener = interface;
  GKLocalPlayerListener = interface;
  GKVoiceChat = interface;
  GKMatchDelegate = interface;
  GKMatchmakerViewControllerDelegate = interface;
  GKMatchmakerViewController = interface;
  GKNotificationBanner = interface;
  GKSession = interface;
  GKSessionDelegate = interface;
  GKVoiceChatService = interface;
  GKVoiceChatClient = interface;
  GKPeerPickerController = interface;
  GKPeerPickerControllerDelegate = interface;
  GKTurnBasedMatchmakerViewControllerDelegate = interface;
  GKTurnBasedMatchmakerViewController = interface;

  // ===== Framework typedefs =====
{$M+}
  NSInteger = Integer;
  PNSInteger = ^NSInteger;

  GKErrorCode = NSInteger;
  GKPhotoSize = NSInteger;
  TGameKitWithCompletionHandler = procedure(param1: UIImage; param2: NSError)
    of object;
  NSNotificationName = NSString;
  PNSNotificationName = ^NSNotificationName;
  TGameKitWithCompletionHandler1 = procedure(param1: NSArray; param2: NSError)
    of object;
  GKLeaderboardTimeScope = NSInteger;
  GKLeaderboardPlayerScope = NSInteger;
  GKLeaderboardType = NSInteger;
  NSTimeInterval = Double;
  PNSTimeInterval = ^NSTimeInterval;

  TGameKitCompletionHandler = procedure(param1: GKLeaderboard) of object;
  NSUInteger = Cardinal;
  PNSUInteger = ^NSUInteger;

  TGameKitCompletionHandler1 = procedure(param1: NSError) of object;

  _NSRange = record
    location: NSUInteger;
    length: NSUInteger;
  end;

  P_NSRange = ^_NSRange;
  NSRange = _NSRange;
  PNSRange = ^NSRange;

  TGameKitCompletionHandler2 = procedure(param1: GKLeaderboardEntry) of object;
  TGameKitCompletionHandler3 = procedure(param1: NSArray; param2: NSArray;
    param3: NSError) of object;
  GKGameCenterViewControllerState = NSInteger;
  GKAccessPointLocation = NSInteger;
  CGFloat = Single;
  PCGFloat = ^CGFloat;

  CGPoint = record
    x: CGFloat;
    y: CGFloat;
  end;

  PCGPoint = ^CGPoint;

  CGSize = record
    width: CGFloat;
    height: CGFloat;
  end;

  PCGSize = ^CGSize;

  CGRect = record
    origin: CGPoint;
    size: CGSize;
  end;

  PCGRect = ^CGRect;

  TGameKitHandler = procedure() of object;
  GKChallengeState = NSInteger;
  GKChallengeComposeCompletionBlock = procedure(param1: UIViewController;
    param2: Boolean; param3: NSArray) of object;
  TGameKitCompletionHandler4 = procedure(param1: GKCloudPlayer; param2: NSError)
    of object;
  GKConnectionState = NSInteger;
  GKTransportType = NSInteger;
  TGameKitCompletionHandler5 = procedure(param1: GKGameSession; param2: NSError)
    of object;
  TGameKitCompletionHandler6 = procedure(param1: NSURL; param2: NSError)
    of object;
  TGameKitCompletionHandler7 = procedure(param1: NSData; param2: NSError)
    of object;
  GKGameSessionErrorCode = NSInteger;
  GKTurnBasedMatchStatus = NSInteger;
  GKTurnBasedParticipantStatus = NSInteger;
  GKTurnBasedMatchOutcome = NSInteger;
  TGameKitWithCompletionHandler2 = procedure(param1: GKTurnBasedMatch;
    param2: NSError) of object;
  TGameKitCompletionHandler8 = procedure(param1: NSData) of object;
  TGameKitCompletionHandler9 = procedure(param1: GKTurnBasedExchange;
    param2: NSError) of object;
  GKTurnBasedExchangeStatus = Int8;
  GKInviteRecipientResponse = NSInteger;
  GKInviteeResponse = GKInviteRecipientResponse;
  PGKInviteeResponse = ^GKInviteeResponse;
  TGameKitRecipientResponseHandler = procedure(param1: GKPlayer;
    param2: GKInviteRecipientResponse) of object;
  TGameKitInviteeResponseHandler = procedure(param1: NSString;
    param2: GKInviteeResponse) of object;
  GKMatchType = NSUInteger;
  TGameKitCompletionHandler10 = procedure(param1: GKMatch; param2: NSError)
    of object;
  TGameKitWithCompletionHandler3 = procedure(param1: NSInteger; param2: NSError)
    of object;
  TGameKitReachableHandler = procedure(param1: GKPlayer; param2: Boolean)
    of object;
  TGameKitHandler1 = procedure(param1: GKPlayer) of object;
  TGameKitInviteHandler = procedure(param1: GKInvite; param2: NSArray)
    of object;
  TGameKitReachableHandler1 = procedure(param1: NSString; param2: Boolean)
    of object;
  TGameKitCompletionHandler11 = procedure(param1: NSString; param2: NSError)
    of object;
  TGameKitCompletionHandler12 = procedure(param1: NSURL; param2: NSData;
    param3: NSData; param4: UInt64; param5: NSError) of object;
  GKFriendsAuthorizationStatus = NSInteger;
  TGameKitCompletionHandler13 = procedure(param1: GKFriendsAuthorizationStatus;
    param2: NSError) of object;
  TGameKitAuthenticateHandler = procedure(param1: UIViewController;
    param2: NSError) of object;
  GKMatchSendDataMode = NSInteger;
  GKPlayerConnectionState = NSInteger;
  TGameKitCompletionHandler14 = procedure(param1: NSString) of object;
  GKMatchmakingMode = NSInteger;
  GKSendDataMode = Integer;
  GKSessionMode = Integer;
  GKPeerConnectionState = Integer;
  GKVoiceChatServiceError = Integer;
  GKPeerPickerConnectionType = NSUInteger;
  TGameKitCompletionHandler15 = procedure(param1: GKSavedGame; param2: NSError)
    of object;
  GKSessionError = Integer;
  GKVoiceChatPlayerState = NSInteger;
  TGameKitPlayerVoiceChatStateDidChangeHandler = procedure(param1: GKPlayer;
    param2: GKVoiceChatPlayerState) of object;
  TGameKitPlayerStateUpdateHandler = procedure(param1: NSString;
    param2: GKVoiceChatPlayerState) of object;
  // ===== Interface declarations =====

  GKBasePlayerClass = interface(NSObjectClass)
    ['{0B467908-6AA3-48DF-ACEC-08AB6C9E752A}']
  end;

  GKBasePlayer = interface(NSObject)
    ['{2B3C714C-A863-475B-951D-937D7542CE15}']
    function playerID: NSString; cdecl;
    function displayName: NSString; cdecl;
  end;

  TGKBasePlayer = class(TOCGenericImport<GKBasePlayerClass, GKBasePlayer>)
  end;

  PGKBasePlayer = Pointer;

  GKPlayerClass = interface(GKBasePlayerClass)
    ['{81CDCCF1-C7F2-4FFB-8850-E69224256583}']
    { class } function anonymousGuestPlayerWithIdentifier(guestIdentifier
      : NSString): Pointer { instancetype }; cdecl;
    { class } procedure loadPlayersForIdentifiers(identifiers: NSArray;
      withCompletionHandler: TGameKitWithCompletionHandler1); cdecl;
  end;

  GKPlayer = interface(GKBasePlayer)
    ['{34B77A91-3D89-49C8-BCE2-FB4122F8C47A}']
    function scopedIDsArePersistent: Boolean; cdecl;
    function gamePlayerID: NSString; cdecl;
    function teamPlayerID: NSString; cdecl;
    function displayName: NSString; cdecl;
    function alias: NSString; cdecl;
    function guestIdentifier: NSString; cdecl;
    function isInvitable: Boolean; cdecl;
    procedure loadPhotoForSize(size: GKPhotoSize;
      withCompletionHandler: TGameKitWithCompletionHandler); cdecl;
    function isFriend: Boolean; cdecl;
    function playerID: NSString; cdecl;
  end;

  TGKPlayer = class(TOCGenericImport<GKPlayerClass, GKPlayer>)
  end;

  PGKPlayer = Pointer;

  GKLocalPlayerClass = interface(GKPlayerClass)
    ['{9FE3D6D3-5A6D-4154-9540-6537C462736F}']
  end;

  GKLocalPlayer = interface(GKPlayer)
    ['{EAA72AAE-E309-4B0C-9ADA-83BA760ECDB9}']
    procedure setLocal(local: GKLocalPlayer); cdecl;
    function local: GKLocalPlayer; cdecl;
    procedure setLocalPlayer(localPlayer: GKLocalPlayer); cdecl;
    function localPlayer: GKLocalPlayer; cdecl;
    function isAuthenticated: Boolean; cdecl;
    function isUnderage: Boolean; cdecl;
    function isMultiplayerGamingRestricted: Boolean; cdecl;
    function isPersonalizedCommunicationRestricted: Boolean; cdecl;
    procedure loadRecentPlayersWithCompletionHandler(completionHandler
      : TGameKitWithCompletionHandler1); cdecl;
    procedure loadChallengableFriendsWithCompletionHandler(completionHandler
      : TGameKitWithCompletionHandler1); cdecl;
    procedure setDefaultLeaderboardIdentifier(leaderboardIdentifier: NSString;
      completionHandler: TGameKitCompletionHandler1); cdecl;
    procedure loadDefaultLeaderboardIdentifierWithCompletionHandler
      (completionHandler: TGameKitCompletionHandler11); cdecl;
    procedure fetchItemsForIdentityVerificationSignature(completionHandler
      : TGameKitCompletionHandler12); cdecl;
    procedure registerListener(listener: Pointer); cdecl;
    procedure unregisterListener(listener: Pointer); cdecl;
    procedure unregisterAllListeners; cdecl;
    procedure setDefaultLeaderboardCategoryID(categoryID: NSString;
      completionHandler: TGameKitCompletionHandler1); cdecl;
    procedure loadDefaultLeaderboardCategoryIDWithCompletionHandler
      (completionHandler: TGameKitCompletionHandler11); cdecl;
    procedure authenticateWithCompletionHandler(completionHandler
      : TGameKitCompletionHandler1); cdecl;
    procedure loadFriendPlayersWithCompletionHandler(completionHandler
      : TGameKitWithCompletionHandler1); cdecl;
    procedure generateIdentityVerificationSignatureWithCompletionHandler
      (completionHandler: TGameKitCompletionHandler12); cdecl;
    procedure loadFriendsWithCompletionHandler(completionHandler
      : TGameKitWithCompletionHandler1); cdecl;
    function friends: NSArray; cdecl;
    procedure loadFriendsAuthorizationStatus(completionHandler
      : TGameKitCompletionHandler13); cdecl;
    procedure loadFriends(completionHandler
      : TGameKitWithCompletionHandler1); cdecl;
    procedure loadFriendsWithIdentifiers(identifiers: NSArray;
      completionHandler: TGameKitWithCompletionHandler1); cdecl;
    procedure setAuthenticateHandler(authenticateHandler
      : TGameKitAuthenticateHandler); cdecl;
    function authenticateHandler: TGameKitAuthenticateHandler; cdecl;
    function isPresentingFriendRequestViewController: Boolean; cdecl;
    function presentFriendRequestCreatorFromViewController(viewController
      : UIViewController; error: NSError): Boolean; cdecl;
    procedure fetchSavedGamesWithCompletionHandler
      (handler: TGameKitWithCompletionHandler1); cdecl;
    procedure saveGameData(data: NSData; withName: NSString;
      completionHandler: TGameKitCompletionHandler15); cdecl;
    procedure deleteSavedGamesWithName(name: NSString;
      completionHandler: TGameKitCompletionHandler1); cdecl;
    procedure resolveConflictingSavedGames(conflictingSavedGames: NSArray;
      withData: NSData;
      completionHandler: TGameKitWithCompletionHandler1); cdecl;
  end;

  TGKLocalPlayer = class(TOCGenericImport<GKLocalPlayerClass, GKLocalPlayer>)
  end;

  PGKLocalPlayer = Pointer;

  GKScoreClass = interface(NSObjectClass)
    ['{77DC53C4-E48D-4911-B808-C0062B4C95AF}']
    [MethodName('reportScores:withCompletionHandler:')]
    { class } procedure reportScoresWithCompletionHandler(scores: NSArray;
      withCompletionHandler: TGameKitCompletionHandler1); cdecl;
    [MethodName('reportScores:withEligibleChallenges:withCompletionHandler:')]
    { class } procedure reportScoresWithEligibleChallengesWithCompletionHandler
      (scores: NSArray; withEligibleChallenges: NSArray;
      withCompletionHandler: TGameKitCompletionHandler1); cdecl;
    { class } procedure reportLeaderboardScores(scores: NSArray;
      withEligibleChallenges: NSArray;
      withCompletionHandler: TGameKitCompletionHandler1); cdecl;
  end;

  GKScore = interface(NSObject)
    ['{52205752-A5BB-4786-B253-2C7B0C884E75}']
    [MethodName('initWithLeaderboardIdentifier:')]
    function initWithLeaderboardIdentifier(identifier: NSString)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithLeaderboardIdentifier:player:')]
    function initWithLeaderboardIdentifierPlayer(identifier: NSString;
      player: GKPlayer): Pointer { instancetype }; cdecl;
    procedure setValue(value: Int64); cdecl;
    function value: Int64; cdecl;
    function formattedValue: NSString; cdecl;
    procedure setLeaderboardIdentifier(leaderboardIdentifier: NSString); cdecl;
    function leaderboardIdentifier: NSString; cdecl;
    procedure setContext(context: UInt64); cdecl;
    function context: UInt64; cdecl;
    function date: NSDate; cdecl;
    function player: GKPlayer; cdecl;
    function rank: NSInteger; cdecl;
    procedure setShouldSetDefaultLeaderboard(shouldSetDefaultLeaderboard
      : Boolean); cdecl;
    function shouldSetDefaultLeaderboard: Boolean; cdecl;
    procedure reportScoreWithCompletionHandler(completionHandler
      : TGameKitCompletionHandler1); cdecl;
    function initWithCategory(category: NSString)
      : Pointer { instancetype }; cdecl;
    procedure setCategory(category: NSString); cdecl;
    function category: NSString; cdecl;
    [MethodName('initWithLeaderboardIdentifier:forPlayer:')]
    function initWithLeaderboardIdentifierForPlayer(identifier: NSString;
      forPlayer: NSString): Pointer { instancetype }; cdecl;
    function playerID: NSString; cdecl;
    procedure issueChallengeToPlayers(playerIDs: NSArray;
      message: NSString); cdecl;
    function challengeComposeControllerWithMessage(message: NSString;
      players: NSArray; completionHandler: GKChallengeComposeCompletionBlock)
      : UIViewController; cdecl;
    function challengeComposeControllerWithPlayers(playerIDs: NSArray;
      message: NSString; completionHandler: GKChallengeComposeCompletionBlock)
      : UIViewController; cdecl;
  end;

  TGKScore = class(TOCGenericImport<GKScoreClass, GKScore>)
  end;

  PGKScore = Pointer;

  GKLeaderboardEntryClass = interface(NSObjectClass)
    ['{C84E2134-F2E3-40B7-B431-D261FC977AFF}']
  end;

  GKLeaderboardEntry = interface(NSObject)
    ['{D3A70E7E-315E-41D1-A321-04D635BE12C3}']
    function player: GKPlayer; cdecl;
    function rank: NSInteger; cdecl;
    function score: NSInteger; cdecl;
    function formattedScore: NSString; cdecl;
    function context: NSUInteger; cdecl;
    function date: NSDate; cdecl;
    function challengeComposeControllerWithMessage(message: NSString;
      players: NSArray; completionHandler: GKChallengeComposeCompletionBlock)
      : UIViewController; cdecl;
  end;

  TGKLeaderboardEntry = class(TOCGenericImport<GKLeaderboardEntryClass,
    GKLeaderboardEntry>)
  end;

  PGKLeaderboardEntry = Pointer;

  GKLeaderboardClass = interface(NSObjectClass)
    ['{9476024C-BF09-4DDE-83B4-C5016E49A1D8}']
    { class } procedure loadLeaderboardsWithIDs(leaderboardIDs: NSArray;
      completionHandler: TGameKitWithCompletionHandler1); cdecl;
    { class } procedure submitScore(score: NSInteger; context: NSUInteger;
      player: GKPlayer; leaderboardIDs: NSArray;
      completionHandler: TGameKitCompletionHandler1); cdecl;
    { class } procedure loadCategoriesWithCompletionHandler(completionHandler
      : TGameKitCompletionHandler3); cdecl;
    { class } procedure setDefaultLeaderboard(leaderboardIdentifier: NSString;
      withCompletionHandler: TGameKitCompletionHandler1); cdecl;
    { class } procedure loadLeaderboardsWithCompletionHandler(completionHandler
      : TGameKitWithCompletionHandler1); cdecl;
  end;

  GKLeaderboard = interface(NSObject)
    ['{6E0620B4-B606-40B4-AAB2-D51AD99B853A}']
    function title: NSString; cdecl;
    function groupIdentifier: NSString; cdecl;
    function baseLeaderboardID: NSString; cdecl;
    function &type: GKLeaderboardType; cdecl;
    function startDate: NSDate; cdecl;
    function nextStartDate: NSDate; cdecl;
    function duration: NSTimeInterval; cdecl;
    procedure loadPreviousOccurrenceWithCompletionHandler(completionHandler
      : TGameKitCompletionHandler); cdecl;
    procedure submitScore(score: NSInteger; context: NSUInteger;
      player: GKPlayer; completionHandler: TGameKitCompletionHandler1); cdecl;
    procedure loadEntriesForPlayerScope(playerScope: GKLeaderboardPlayerScope;
      timeScope: GKLeaderboardTimeScope; range: NSRange;
      completionHandler: TGameKitCompletionHandler2); cdecl;
    procedure loadEntriesForPlayers(players: NSArray;
      timeScope: GKLeaderboardTimeScope;
      completionHandler: TGameKitCompletionHandler2); cdecl;
    procedure setCategory(category: NSString); cdecl;
    function category: NSString; cdecl;
    function initWithPlayerIDs(playerIDs: NSArray)
      : Pointer { instancetype }; cdecl;
    procedure setTimeScope(timeScope: GKLeaderboardTimeScope); cdecl;
    function timeScope: GKLeaderboardTimeScope; cdecl;
    procedure setPlayerScope(playerScope: GKLeaderboardPlayerScope); cdecl;
    function playerScope: GKLeaderboardPlayerScope; cdecl;
    procedure setIdentifier(identifier: NSString); cdecl;
    function identifier: NSString; cdecl;
    procedure setRange(range: NSRange); cdecl;
    function range: NSRange; cdecl;
    function scores: NSArray; cdecl;
    function maxRange: NSUInteger; cdecl;
    function localPlayerScore: GKScore; cdecl;
    function isLoading: Boolean; cdecl;
    function init: Pointer { instancetype }; cdecl;
    function initWithPlayers(players: NSArray): Pointer { instancetype }; cdecl;
    procedure loadScoresWithCompletionHandler(completionHandler
      : TGameKitWithCompletionHandler1); cdecl;
    procedure loadImageWithCompletionHandler(completionHandler
      : TGameKitWithCompletionHandler); cdecl;
  end;

  TGKLeaderboard = class(TOCGenericImport<GKLeaderboardClass, GKLeaderboard>)
  end;

  PGKLeaderboard = Pointer;

  GKAchievementClass = interface(NSObjectClass)
    ['{AD008E19-410A-4DE2-9B8D-FCD5F8AE3CEA}']
    { class } procedure loadAchievementsWithCompletionHandler(completionHandler
      : TGameKitWithCompletionHandler1); cdecl;
    { class } procedure resetAchievementsWithCompletionHandler(completionHandler
      : TGameKitCompletionHandler1); cdecl;
    [MethodName('reportAchievements:withCompletionHandler:')]
    { class } procedure reportAchievementsWithCompletionHandler
      (achievements: NSArray;
      withCompletionHandler: TGameKitCompletionHandler1); cdecl;
    [MethodName
      ('reportAchievements:withEligibleChallenges:withCompletionHandler:')]
    { class } procedure
      reportAchievementsWithEligibleChallengesWithCompletionHandler
      (achievements: NSArray; withEligibleChallenges: NSArray;
      withCompletionHandler: TGameKitCompletionHandler1); cdecl;
  end;

  GKAchievement = interface(NSObject)
    ['{F7CEC796-4121-47AA-B4AC-7CDAD6B0067D}']
    [MethodName('initWithIdentifier:')]
    function initWithIdentifier(identifier: NSString)
      : Pointer { instancetype }; cdecl;
    [MethodName('initWithIdentifier:player:')]
    function initWithIdentifierPlayer(identifier: NSString; player: GKPlayer)
      : Pointer { instancetype }; cdecl;
    procedure setIdentifier(identifier: NSString); cdecl;
    function identifier: NSString; cdecl;
    procedure setPercentComplete(percentComplete: Double); cdecl;
    function percentComplete: Double; cdecl;
    function isCompleted: Boolean; cdecl;
    function lastReportedDate: NSDate; cdecl;
    procedure setShowsCompletionBanner(showsCompletionBanner: Boolean); cdecl;
    function showsCompletionBanner: Boolean; cdecl;
    function player: GKPlayer; cdecl;
    procedure reportAchievementWithCompletionHandler(completionHandler
      : TGameKitCompletionHandler1); cdecl;
    function isHidden: Boolean; cdecl;
    [MethodName('initWithIdentifier:forPlayer:')]
    function initWithIdentifierForPlayer(identifier: NSString;
      forPlayer: NSString): Pointer { instancetype }; cdecl;
    function playerID: NSString; cdecl;
    procedure selectChallengeablePlayers(players: NSArray;
      withCompletionHandler: TGameKitWithCompletionHandler1); cdecl;
    procedure issueChallengeToPlayers(playerIDs: NSArray;
      message: NSString); cdecl;
    procedure selectChallengeablePlayerIDs(playerIDs: NSArray;
      withCompletionHandler: TGameKitWithCompletionHandler1); cdecl;
    function challengeComposeControllerWithMessage(message: NSString;
      players: NSArray; completionHandler: GKChallengeComposeCompletionBlock)
      : UIViewController; cdecl;
    function challengeComposeControllerWithPlayers(playerIDs: NSArray;
      message: NSString; completionHandler: GKChallengeComposeCompletionBlock)
      : UIViewController; cdecl;
  end;

  TGKAchievement = class(TOCGenericImport<GKAchievementClass, GKAchievement>)
  end;

  PGKAchievement = Pointer;

  GKGameCenterViewControllerClass = interface(UINavigationControllerClass)
    ['{A4BA01AF-15DB-4C3E-8A12-DCF817D04348}']
  end;

  GKGameCenterViewController = interface(UINavigationController)
    ['{75975B86-34AC-4697-81E8-908F8421BAE8}']
    procedure setGameCenterDelegate(gameCenterDelegate: Pointer); cdecl;
    function gameCenterDelegate: Pointer; cdecl;
    function initWithState(state: GKGameCenterViewControllerState)
      : Pointer { instancetype }; cdecl;
    function initWithLeaderboardID(leaderboardID: NSString;
      playerScope: GKLeaderboardPlayerScope; timeScope: GKLeaderboardTimeScope)
      : Pointer { instancetype }; cdecl;
    function initWithLeaderboard(leaderboard: GKLeaderboard;
      playerScope: GKLeaderboardPlayerScope): Pointer { instancetype }; cdecl;
    function initWithAchievementID(achievementID: NSString)
      : Pointer { instancetype }; cdecl;
    procedure setViewState(viewState: GKGameCenterViewControllerState); cdecl;
    function viewState: GKGameCenterViewControllerState; cdecl;
    procedure setLeaderboardTimeScope(leaderboardTimeScope
      : GKLeaderboardTimeScope); cdecl;
    function leaderboardTimeScope: GKLeaderboardTimeScope; cdecl;
    procedure setLeaderboardIdentifier(leaderboardIdentifier: NSString); cdecl;
    function leaderboardIdentifier: NSString; cdecl;
    procedure setLeaderboardCategory(leaderboardCategory: NSString); cdecl;
    function leaderboardCategory: NSString; cdecl;
  end;

  TGKGameCenterViewController = class
    (TOCGenericImport<GKGameCenterViewControllerClass,
    GKGameCenterViewController>)
  end;

  PGKGameCenterViewController = Pointer;

  GKAccessPointClass = interface(NSObjectClass)
    ['{07B5DA16-DE97-47A0-8CEA-BC0BF6AB26F8}']
  end;

  GKAccessPoint = interface(NSObject)
    ['{544C6E9C-3468-4AED-9336-2B00AD784D9D}']
    procedure setShared(shared: GKAccessPoint); cdecl;
    function shared: GKAccessPoint; cdecl;
    procedure setActive(active: Boolean); cdecl;
    function isActive: Boolean; cdecl;
    procedure setFocused(focused: Boolean); cdecl;
    function isFocused: Boolean; cdecl;
    function isVisible: Boolean; cdecl;
    function isPresentingGameCenter: Boolean; cdecl;
    procedure setShowHighlights(showHighlights: Boolean); cdecl;
    function showHighlights: Boolean; cdecl;
    procedure setLocation(location: GKAccessPointLocation); cdecl;
    function location: GKAccessPointLocation; cdecl;
    function frameInScreenCoordinates: CGRect; cdecl;
    procedure setParentWindow(parentWindow: UIWindow); cdecl;
    function parentWindow: UIWindow; cdecl;
    procedure triggerAccessPointWithHandler(handler: TGameKitHandler); cdecl;
    procedure triggerAccessPointWithState
      (state: GKGameCenterViewControllerState; handler: TGameKitHandler); cdecl;
  end;

  TGKAccessPoint = class(TOCGenericImport<GKAccessPointClass, GKAccessPoint>)
  end;

  PGKAccessPoint = Pointer;

  GKAchievementDescriptionClass = interface(NSObjectClass)
    ['{5FC8DE68-1EC8-4012-83C9-3A099B66E4FB}']
    { class } procedure loadAchievementDescriptionsWithCompletionHandler
      (completionHandler: TGameKitWithCompletionHandler1); cdecl;
    { class } function incompleteAchievementImage: UIImage; cdecl;
    { class } function placeholderCompletedAchievementImage: UIImage; cdecl;
  end;

  GKAchievementDescription = interface(NSObject)
    ['{732145B0-0FC9-4AA8-8837-974C20A22147}']
    function identifier: NSString; cdecl;
    function groupIdentifier: NSString; cdecl;
    function title: NSString; cdecl;
    function achievedDescription: NSString; cdecl;
    function unachievedDescription: NSString; cdecl;
    function maximumPoints: NSInteger; cdecl;
    function isHidden: Boolean; cdecl;
    function isReplayable: Boolean; cdecl;
    function image: UIImage; cdecl;
    procedure loadImageWithCompletionHandler(completionHandler
      : TGameKitWithCompletionHandler); cdecl;
  end;

  TGKAchievementDescription = class
    (TOCGenericImport<GKAchievementDescriptionClass, GKAchievementDescription>)
  end;

  PGKAchievementDescription = Pointer;

  GKAchievementViewControllerClass = interface(GKGameCenterViewControllerClass)
    ['{4D9CBA8A-F890-4DAC-83E3-07E4EC483C33}']
  end;

  GKAchievementViewController = interface(GKGameCenterViewController)
    ['{A3F53F7C-3E3F-47FD-8089-7B42AB81C3F0}']
    procedure setAchievementDelegate(achievementDelegate: Pointer); cdecl;
    function achievementDelegate: Pointer; cdecl;
  end;

  TGKAchievementViewController = class
    (TOCGenericImport<GKAchievementViewControllerClass,
    GKAchievementViewController>)
  end;

  PGKAchievementViewController = Pointer;

  GKLeaderboardScoreClass = interface(NSObjectClass)
    ['{C4606234-7659-47EF-BFF1-A984EBC3970A}']
  end;

  GKLeaderboardScore = interface(NSObject)
    ['{C2C7BB3F-FACF-4518-8814-CA2983BB824E}']
    procedure setPlayer(player: GKPlayer); cdecl;
    function player: GKPlayer; cdecl;
    procedure setValue(value: NSInteger); cdecl;
    function value: NSInteger; cdecl;
    procedure setContext(context: NSUInteger); cdecl;
    function context: NSUInteger; cdecl;
    procedure setLeaderboardID(leaderboardID: NSString); cdecl;
    function leaderboardID: NSString; cdecl;
  end;

  TGKLeaderboardScore = class(TOCGenericImport<GKLeaderboardScoreClass,
    GKLeaderboardScore>)
  end;

  PGKLeaderboardScore = Pointer;

  GKChallengeClass = interface(NSObjectClass)
    ['{73F1331D-96DE-47FF-90ED-EF9407F9BC35}']
    { class } procedure loadReceivedChallengesWithCompletionHandler
      (completionHandler: TGameKitWithCompletionHandler1); cdecl;
  end;

  GKChallenge = interface(NSObject)
    ['{13C6120D-E153-479A-9D16-21E2BA430410}']
    procedure decline; cdecl;
    function issuingPlayer: GKPlayer; cdecl;
    function receivingPlayer: GKPlayer; cdecl;
    function state: GKChallengeState; cdecl;
    function issueDate: NSDate; cdecl;
    function completionDate: NSDate; cdecl;
    function message: NSString; cdecl;
    function issuingPlayerID: NSString; cdecl;
    function receivingPlayerID: NSString; cdecl;
  end;

  TGKChallenge = class(TOCGenericImport<GKChallengeClass, GKChallenge>)
  end;

  PGKChallenge = Pointer;

  GKScoreChallengeClass = interface(GKChallengeClass)
    ['{6FB42E41-3DC5-41F5-AFC3-5A0112191865}']
  end;

  GKScoreChallenge = interface(GKChallenge)
    ['{364F6715-46BF-462B-9220-2C1B64CB95E9}']
    function score: GKScore; cdecl;
  end;

  TGKScoreChallenge = class(TOCGenericImport<GKScoreChallengeClass,
    GKScoreChallenge>)
  end;

  PGKScoreChallenge = Pointer;

  GKAchievementChallengeClass = interface(GKChallengeClass)
    ['{EB51A429-B61E-45F0-BDD3-9E25DB7C73B2}']
  end;

  GKAchievementChallenge = interface(GKChallenge)
    ['{A4BB1F75-F4B2-454D-94E2-10562A115127}']
    function achievement: GKAchievement; cdecl;
  end;

  TGKAchievementChallenge = class(TOCGenericImport<GKAchievementChallengeClass,
    GKAchievementChallenge>)
  end;

  PGKAchievementChallenge = Pointer;

  GKChallengeEventHandlerClass = interface(NSObjectClass)
    ['{D045B83A-46B6-4631-B6CC-4C4C89D4A814}']
    { class } function challengeEventHandler: GKChallengeEventHandler; cdecl;
  end;

  GKChallengeEventHandler = interface(NSObject)
    ['{1A87A7D0-C17E-43ED-AFB0-DA15DC4A09AC}']
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
  end;

  TGKChallengeEventHandler = class
    (TOCGenericImport<GKChallengeEventHandlerClass, GKChallengeEventHandler>)
  end;

  PGKChallengeEventHandler = Pointer;

  GKCloudPlayerClass = interface(GKBasePlayerClass)
    ['{BBA6CD3B-1C92-4332-8431-BD9449E88DAD}']
    { class } procedure getCurrentSignedInPlayerForContainer
      (containerName: NSString;
      completionHandler: TGameKitCompletionHandler4); cdecl;
  end;

  GKCloudPlayer = interface(GKBasePlayer)
    ['{3C929265-A208-4946-8F5F-AE7AB6ABA85F}']
  end;

  TGKCloudPlayer = class(TOCGenericImport<GKCloudPlayerClass, GKCloudPlayer>)
  end;

  PGKCloudPlayer = Pointer;

  GKFriendRequestComposeViewControllerClass = interface
    (UINavigationControllerClass)
    ['{EEB7139C-511A-44B1-A78C-C087FB75FFBD}']
    { class } function maxNumberOfRecipients: NSUInteger; cdecl;
  end;

  GKFriendRequestComposeViewController = interface(UINavigationController)
    ['{84EAF4CB-7592-4D1E-AEFE-743ECA4B6334}']
    procedure setComposeViewDelegate(composeViewDelegate: Pointer); cdecl;
    function composeViewDelegate: Pointer; cdecl;
    procedure setMessage(message: NSString); cdecl;
    procedure addRecipientPlayers(players: NSArray); cdecl;
    procedure addRecipientsWithPlayerIDs(playerIDs: NSArray); cdecl;
    procedure addRecipientsWithEmailAddresses(emailAddresses: NSArray); cdecl;
  end;

  TGKFriendRequestComposeViewController = class
    (TOCGenericImport<GKFriendRequestComposeViewControllerClass,
    GKFriendRequestComposeViewController>)
  end;

  PGKFriendRequestComposeViewController = Pointer;

  GKGameSessionClass = interface(NSObjectClass)
    ['{2AD68E20-22C4-437D-B2FB-F7A078D83C7A}']
    { class } procedure createSessionInContainer(containerName: NSString;
      withTitle: NSString; maxConnectedPlayers: NSInteger;
      completionHandler: TGameKitCompletionHandler5); cdecl;
    { class } procedure loadSessionsInContainer(containerName: NSString;
      completionHandler: TGameKitWithCompletionHandler1); cdecl;
    { class } procedure loadSessionWithIdentifier(identifier: NSString;
      completionHandler: TGameKitCompletionHandler5); cdecl;
    { class } procedure removeSessionWithIdentifier(identifier: NSString;
      completionHandler: TGameKitCompletionHandler1); cdecl;
    { class } procedure addEventListener(listener: NSObject); cdecl;
    { class } procedure removeEventListener(listener: NSObject); cdecl;
  end;

  GKGameSession = interface(NSObject)
    ['{3DE0B9EC-0237-4ABC-BEB4-36484C2EEF43}']
    function identifier: NSString; cdecl;
    function title: NSString; cdecl;
    function owner: GKCloudPlayer; cdecl;
    function players: NSArray; cdecl;
    function lastModifiedDate: NSDate; cdecl;
    function lastModifiedPlayer: GKCloudPlayer; cdecl;
    function maxNumberOfConnectedPlayers: NSInteger; cdecl;
    function badgedPlayers: NSArray; cdecl;
    procedure getShareURLWithCompletionHandler(completionHandler
      : TGameKitCompletionHandler6); cdecl;
    procedure loadDataWithCompletionHandler(completionHandler
      : TGameKitCompletionHandler7); cdecl;
    procedure saveData(data: NSData;
      completionHandler: TGameKitCompletionHandler7); cdecl;
    procedure setConnectionState(state: GKConnectionState;
      completionHandler: TGameKitCompletionHandler1); cdecl;
    function playersWithConnectionState(state: GKConnectionState)
      : NSArray; cdecl;
    procedure sendData(data: NSData; withTransportType: GKTransportType;
      completionHandler: TGameKitCompletionHandler1); cdecl;
    procedure sendMessageWithLocalizedFormatKey(key: NSString;
      arguments: NSArray; data: NSData; toPlayers: NSArray;
      badgePlayers: Boolean;
      completionHandler: TGameKitCompletionHandler1); cdecl;
    procedure clearBadgeForPlayers(players: NSArray;
      completionHandler: TGameKitCompletionHandler1); cdecl;
  end;

  TGKGameSession = class(TOCGenericImport<GKGameSessionClass, GKGameSession>)
  end;

  PGKGameSession = Pointer;

  GKLeaderboardSetClass = interface(NSObjectClass)
    ['{57780B40-F8F6-48BB-AEC7-4C13BFF7DC13}']
    { class } procedure loadLeaderboardSetsWithCompletionHandler
      (completionHandler: TGameKitWithCompletionHandler1); cdecl;
  end;

  GKLeaderboardSet = interface(NSObject)
    ['{93379F21-F57F-4EC0-9B91-BF22EF6F467D}']
    function title: NSString; cdecl;
    function groupIdentifier: NSString; cdecl;
    procedure setIdentifier(identifier: NSString); cdecl;
    function identifier: NSString; cdecl;
    procedure loadLeaderboardsWithHandler
      (handler: TGameKitWithCompletionHandler1); cdecl;
    procedure loadLeaderboardsWithCompletionHandler(completionHandler
      : TGameKitWithCompletionHandler1); cdecl;
    procedure loadImageWithCompletionHandler(completionHandler
      : TGameKitWithCompletionHandler); cdecl;
  end;

  TGKLeaderboardSet = class(TOCGenericImport<GKLeaderboardSetClass,
    GKLeaderboardSet>)
  end;

  PGKLeaderboardSet = Pointer;

  GKLeaderboardViewControllerClass = interface(GKGameCenterViewControllerClass)
    ['{58FC91DD-1D3B-4347-8090-8567673D0C19}']
  end;

  GKLeaderboardViewController = interface(GKGameCenterViewController)
    ['{C710DCE0-08F4-488A-BF83-EE496C9471A3}']
    procedure setTimeScope(timeScope: GKLeaderboardTimeScope); cdecl;
    function timeScope: GKLeaderboardTimeScope; cdecl;
    procedure setCategory(category: NSString); cdecl;
    function category: NSString; cdecl;
    procedure setLeaderboardDelegate(leaderboardDelegate: Pointer); cdecl;
    function leaderboardDelegate: Pointer; cdecl;
  end;

  TGKLeaderboardViewController = class
    (TOCGenericImport<GKLeaderboardViewControllerClass,
    GKLeaderboardViewController>)
  end;

  PGKLeaderboardViewController = Pointer;

  GKMatchRequestClass = interface(NSObjectClass)
    ['{8C225A57-F255-4120-ADC5-443C998B44D2}']
    { class } function maxPlayersAllowedForMatchOfType(matchType: GKMatchType)
      : NSUInteger; cdecl;
  end;

  GKMatchRequest = interface(NSObject)
    ['{4DFA7144-F9A7-4508-BB9F-BE7260E0C2A6}']
    procedure setMinPlayers(minPlayers: NSUInteger); cdecl;
    function minPlayers: NSUInteger; cdecl;
    procedure setMaxPlayers(maxPlayers: NSUInteger); cdecl;
    function maxPlayers: NSUInteger; cdecl;
    procedure setPlayerGroup(playerGroup: NSUInteger); cdecl;
    function playerGroup: NSUInteger; cdecl;
    procedure setPlayerAttributes(playerAttributes: LongWord); cdecl;
    function playerAttributes: LongWord; cdecl;
    procedure setRecipients(recipients: NSArray); cdecl;
    function recipients: NSArray; cdecl;
    procedure setInviteMessage(inviteMessage: NSString); cdecl;
    function inviteMessage: NSString; cdecl;
    procedure setDefaultNumberOfPlayers(defaultNumberOfPlayers
      : NSUInteger); cdecl;
    function defaultNumberOfPlayers: NSUInteger; cdecl;
    procedure setRestrictToAutomatch(restrictToAutomatch: Boolean); cdecl;
    function restrictToAutomatch: Boolean; cdecl;
    procedure setRecipientResponseHandler(recipientResponseHandler
      : TGameKitRecipientResponseHandler); cdecl;
    function recipientResponseHandler: TGameKitRecipientResponseHandler; cdecl;
    procedure setInviteeResponseHandler(inviteeResponseHandler
      : TGameKitInviteeResponseHandler); cdecl;
    function inviteeResponseHandler: TGameKitInviteeResponseHandler; cdecl;
    procedure setPlayersToInvite(playersToInvite: NSArray); cdecl;
    function playersToInvite: NSArray; cdecl;
  end;

  TGKMatchRequest = class(TOCGenericImport<GKMatchRequestClass, GKMatchRequest>)
  end;

  PGKMatchRequest = Pointer;

  GKTurnBasedMatchClass = interface(NSObjectClass)
    ['{09EF03CF-3F51-41A4-8C64-36A0B7078F91}']
    { class } procedure findMatchForRequest(request: GKMatchRequest;
      withCompletionHandler: TGameKitWithCompletionHandler2); cdecl;
    { class } procedure loadMatchesWithCompletionHandler(completionHandler
      : TGameKitWithCompletionHandler1); cdecl;
    { class } procedure loadMatchWithID(matchID: NSString;
      withCompletionHandler: TGameKitWithCompletionHandler2); cdecl;
  end;

  GKTurnBasedMatch = interface(NSObject)
    ['{51CA1343-B16A-40BD-BA63-2FCFDF6A9F52}']
    function matchID: NSString; cdecl;
    function creationDate: NSDate; cdecl;
    function participants: NSArray; cdecl;
    function status: GKTurnBasedMatchStatus; cdecl;
    function currentParticipant: GKTurnBasedParticipant; cdecl;
    function matchData: NSData; cdecl;
    procedure setLocalizableMessageWithKey(key: NSString;
      arguments: NSArray); cdecl;
    procedure setMessage(message: NSString); cdecl;
    function message: NSString; cdecl;
    function matchDataMaximumSize: NSUInteger; cdecl;
    function exchanges: NSArray; cdecl;
    function activeExchanges: NSArray; cdecl;
    function completedExchanges: NSArray; cdecl;
    function exchangeDataMaximumSize: NSUInteger; cdecl;
    function exchangeMaxInitiatedExchangesPerPlayer: NSUInteger; cdecl;
    procedure rematchWithCompletionHandler(completionHandler
      : TGameKitWithCompletionHandler2); cdecl;
    procedure acceptInviteWithCompletionHandler(completionHandler
      : TGameKitWithCompletionHandler2); cdecl;
    procedure declineInviteWithCompletionHandler(completionHandler
      : TGameKitCompletionHandler1); cdecl;
    procedure removeWithCompletionHandler(completionHandler
      : TGameKitCompletionHandler1); cdecl;
    procedure loadMatchDataWithCompletionHandler(completionHandler
      : TGameKitCompletionHandler8); cdecl;
    procedure endTurnWithNextParticipants(nextParticipants: NSArray;
      turnTimeout: NSTimeInterval; matchData: NSData;
      completionHandler: TGameKitCompletionHandler1); cdecl;
    [MethodName
      ('participantQuitInTurnWithOutcome:nextParticipants:turnTimeout:matchData:completionHandler:')
      ]
    procedure participantQuitInTurnWithOutcomeNextParticipantsTurnTimeoutMatchDataCompletionHandler
      (matchOutcome: GKTurnBasedMatchOutcome; nextParticipants: NSArray;
      turnTimeout: NSTimeInterval; matchData: NSData;
      completionHandler: TGameKitCompletionHandler1); cdecl;
    procedure participantQuitOutOfTurnWithOutcome(matchOutcome
      : GKTurnBasedMatchOutcome;
      withCompletionHandler: TGameKitCompletionHandler1); cdecl;
    [MethodName('endMatchInTurnWithMatchData:completionHandler:')]
    procedure endMatchInTurnWithMatchDataCompletionHandler(matchData: NSData;
      completionHandler: TGameKitCompletionHandler1); cdecl;
    [MethodName
      ('endMatchInTurnWithMatchData:scores:achievements:completionHandler:')]
    procedure endMatchInTurnWithMatchDataScoresAchievementsCompletionHandler
      (matchData: NSData; scores: NSArray; achievements: NSArray;
      completionHandler: TGameKitCompletionHandler1); cdecl;
    [MethodName
      ('endMatchInTurnWithMatchData:leaderboardScores:achievements:completionHandler:')
      ]
    procedure endMatchInTurnWithMatchDataLeaderboardScoresAchievementsCompletionHandler
      (matchData: NSData; leaderboardScores: NSArray; achievements: NSArray;
      completionHandler: TGameKitCompletionHandler1); cdecl;
    procedure saveCurrentTurnWithMatchData(matchData: NSData;
      completionHandler: TGameKitCompletionHandler1); cdecl;
    procedure saveMergedMatchData(matchData: NSData;
      withResolvedExchanges: NSArray;
      completionHandler: TGameKitCompletionHandler1); cdecl;
    procedure sendExchangeToParticipants(participants: NSArray; data: NSData;
      localizableMessageKey: NSString; arguments: NSArray;
      timeout: NSTimeInterval;
      completionHandler: TGameKitCompletionHandler9); cdecl;
    procedure sendReminderToParticipants(participants: NSArray;
      localizableMessageKey: NSString; arguments: NSArray;
      completionHandler: TGameKitCompletionHandler1); cdecl;
    procedure endTurnWithNextParticipant(nextParticipant
      : GKTurnBasedParticipant; matchData: NSData;
      completionHandler: TGameKitCompletionHandler1); cdecl;
    [MethodName
      ('participantQuitInTurnWithOutcome:nextParticipant:matchData:completionHandler:')
      ]
    procedure participantQuitInTurnWithOutcomeNextParticipantMatchDataCompletionHandler
      (matchOutcome: GKTurnBasedMatchOutcome;
      nextParticipant: GKTurnBasedParticipant; matchData: NSData;
      completionHandler: TGameKitCompletionHandler1); cdecl;
  end;

  TGKTurnBasedMatch = class(TOCGenericImport<GKTurnBasedMatchClass,
    GKTurnBasedMatch>)
  end;

  PGKTurnBasedMatch = Pointer;

  GKTurnBasedExchangeClass = interface(NSObjectClass)
    ['{B7082292-9890-4520-9F34-5766A81BBAC5}']
  end;

  GKTurnBasedExchange = interface(NSObject)
    ['{C7C7451D-A2BC-41AD-B02F-4CA3EE361637}']
    function exchangeID: NSString; cdecl;
    function sender: GKTurnBasedParticipant; cdecl;
    function recipients: NSArray; cdecl;
    function status: GKTurnBasedExchangeStatus; cdecl;
    function message: NSString; cdecl;
    function data: NSData; cdecl;
    function sendDate: NSDate; cdecl;
    function timeoutDate: NSDate; cdecl;
    function completionDate: NSDate; cdecl;
    function replies: NSArray; cdecl;
    procedure cancelWithLocalizableMessageKey(key: NSString; arguments: NSArray;
      completionHandler: TGameKitCompletionHandler1); cdecl;
    procedure replyWithLocalizableMessageKey(key: NSString; arguments: NSArray;
      data: NSData; completionHandler: TGameKitCompletionHandler1); cdecl;
  end;

  TGKTurnBasedExchange = class(TOCGenericImport<GKTurnBasedExchangeClass,
    GKTurnBasedExchange>)
  end;

  PGKTurnBasedExchange = Pointer;

  GKTurnBasedExchangeReplyClass = interface(NSObjectClass)
    ['{1FA801D8-2653-4AA0-BF84-618C552ECE4F}']
  end;

  GKTurnBasedExchangeReply = interface(NSObject)
    ['{93D80B7A-8C55-4B72-BACE-96AA6E92C5DD}']
    function recipient: GKTurnBasedParticipant; cdecl;
    function message: NSString; cdecl;
    function data: NSData; cdecl;
    function replyDate: NSDate; cdecl;
  end;

  TGKTurnBasedExchangeReply = class
    (TOCGenericImport<GKTurnBasedExchangeReplyClass, GKTurnBasedExchangeReply>)
  end;

  PGKTurnBasedExchangeReply = Pointer;

  GKTurnBasedParticipantClass = interface(NSObjectClass)
    ['{F11B93D9-CF3D-4B38-A16A-5526C0A6020A}']
  end;

  GKTurnBasedParticipant = interface(NSObject)
    ['{C64F0A44-4256-457D-BB97-DAC8AF734663}']
    function player: GKPlayer; cdecl;
    function lastTurnDate: NSDate; cdecl;
    function status: GKTurnBasedParticipantStatus; cdecl;
    procedure setMatchOutcome(matchOutcome: GKTurnBasedMatchOutcome); cdecl;
    function matchOutcome: GKTurnBasedMatchOutcome; cdecl;
    function timeoutDate: NSDate; cdecl;
    function playerID: NSString; cdecl;
  end;

  TGKTurnBasedParticipant = class(TOCGenericImport<GKTurnBasedParticipantClass,
    GKTurnBasedParticipant>)
  end;

  PGKTurnBasedParticipant = Pointer;

  GKTurnBasedEventHandlerClass = interface(NSObjectClass)
    ['{6D9CE514-BF65-48F6-A5D1-3E48B95EDC13}']
    { class } function sharedTurnBasedEventHandler
      : GKTurnBasedEventHandler; cdecl;
  end;

  GKTurnBasedEventHandler = interface(NSObject)
    ['{6933275B-6FEA-48C0-A97E-A2C301E50FE6}']
    procedure setDelegate(delegate: NSObject); cdecl;
    function delegate: NSObject; cdecl;
  end;

  TGKTurnBasedEventHandler = class
    (TOCGenericImport<GKTurnBasedEventHandlerClass, GKTurnBasedEventHandler>)
  end;

  PGKTurnBasedEventHandler = Pointer;

  GKMatchClass = interface(NSObjectClass)
    ['{6A86C4A6-124B-4CB0-A317-036C1177FDE2}']
  end;

  GKMatch = interface(NSObject)
    ['{5E4A51BC-83CF-4E19-B0BD-508F03B2E64B}']
    function players: NSArray; cdecl;
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    function expectedPlayerCount: NSUInteger; cdecl;
    [MethodName('sendData:toPlayers:dataMode:error:')]
    function sendDataToPlayersDataModeError(data: NSData; toPlayers: NSArray;
      dataMode: GKMatchSendDataMode; error: NSError): Boolean; cdecl;
    function sendDataToAllPlayers(data: NSData;
      withDataMode: GKMatchSendDataMode; error: NSError): Boolean; cdecl;
    procedure disconnect; cdecl;
    function voiceChatWithName(name: NSString): GKVoiceChat; cdecl;
    procedure chooseBestHostingPlayerWithCompletionHandler(completionHandler
      : TGameKitHandler1); cdecl;
    procedure rematchWithCompletionHandler(completionHandler
      : TGameKitCompletionHandler10); cdecl;
    procedure chooseBestHostPlayerWithCompletionHandler(completionHandler
      : TGameKitCompletionHandler14); cdecl;
    [MethodName('sendData:toPlayers:withDataMode:error:')]
    function sendDataToPlayersWithDataModeError(data: NSData;
      toPlayers: NSArray; withDataMode: GKMatchSendDataMode; error: NSError)
      : Boolean; cdecl;
    function playerIDs: NSArray; cdecl;
  end;

  TGKMatch = class(TOCGenericImport<GKMatchClass, GKMatch>)
  end;

  PGKMatch = Pointer;

  GKInviteClass = interface(NSObjectClass)
    ['{5C41AE1A-5A36-48BA-8D07-4F956A5D8EBB}']
  end;

  GKInvite = interface(NSObject)
    ['{230BBFC6-11F2-423B-8AE6-8130A2F0D3C3}']
    function sender: GKPlayer; cdecl;
    function isHosted: Boolean; cdecl;
    function playerGroup: NSUInteger; cdecl;
    function playerAttributes: LongWord; cdecl;
    function inviter: NSString; cdecl;
  end;

  TGKInvite = class(TOCGenericImport<GKInviteClass, GKInvite>)
  end;

  PGKInvite = Pointer;

  GKMatchmakerClass = interface(NSObjectClass)
    ['{502B3841-1E26-44B7-B798-E4A832D66F30}']
    { class } function sharedMatchmaker: GKMatchmaker; cdecl;
  end;

  GKMatchmaker = interface(NSObject)
    ['{AB06D0F1-E3B6-4A5F-AA11-D9F51954A857}']
    procedure matchForInvite(invite: GKInvite;
      completionHandler: TGameKitCompletionHandler10); cdecl;
    procedure findMatchForRequest(request: GKMatchRequest;
      withCompletionHandler: TGameKitCompletionHandler10); cdecl;
    procedure findPlayersForHostedRequest(request: GKMatchRequest;
      withCompletionHandler: TGameKitWithCompletionHandler1); cdecl;
    procedure addPlayersToMatch(match: GKMatch; matchRequest: GKMatchRequest;
      completionHandler: TGameKitCompletionHandler1); cdecl;
    procedure cancel; cdecl;
    procedure cancelPendingInviteToPlayer(player: GKPlayer); cdecl;
    procedure finishMatchmakingForMatch(match: GKMatch); cdecl;
    procedure queryPlayerGroupActivity(playerGroup: NSUInteger;
      withCompletionHandler: TGameKitWithCompletionHandler3); cdecl;
    procedure queryActivityWithCompletionHandler(completionHandler
      : TGameKitWithCompletionHandler3); cdecl;
    procedure startBrowsingForNearbyPlayersWithHandler(reachableHandler
      : TGameKitReachableHandler); cdecl;
    procedure stopBrowsingForNearbyPlayers; cdecl;
    procedure startGroupActivityWithPlayerHandler
      (handler: TGameKitHandler1); cdecl;
    procedure stopGroupActivity; cdecl;
    procedure setInviteHandler(inviteHandler: TGameKitInviteHandler); cdecl;
    function inviteHandler: TGameKitInviteHandler; cdecl;
    procedure startBrowsingForNearbyPlayersWithReachableHandler(reachableHandler
      : TGameKitReachableHandler1); cdecl;
    procedure cancelInviteToPlayer(playerID: NSString); cdecl;
    procedure findPlayersForHostedMatchRequest(request: GKMatchRequest;
      withCompletionHandler: TGameKitWithCompletionHandler1); cdecl;
  end;

  TGKMatchmaker = class(TOCGenericImport<GKMatchmakerClass, GKMatchmaker>)
  end;

  PGKMatchmaker = Pointer;

  GKSavedGameClass = interface(NSObjectClass)
    ['{B9CC88A7-E063-4BF3-9982-1BF65FAC31C2}']
  end;

  GKSavedGame = interface(NSObject)
    ['{57667868-C5D3-4C2F-AF46-F9F3F382491D}']
    function name: NSString; cdecl;
    function deviceName: NSString; cdecl;
    function modificationDate: NSDate; cdecl;
    procedure loadDataWithCompletionHandler
      (handler: TGameKitCompletionHandler7); cdecl;
  end;

  TGKSavedGame = class(TOCGenericImport<GKSavedGameClass, GKSavedGame>)
  end;

  PGKSavedGame = Pointer;

  GKVoiceChatClass = interface(NSObjectClass)
    ['{DA5DBBC7-B1B9-4609-9EB7-4D2082CBDDD4}']
    { class } function isVoIPAllowed: Boolean; cdecl;
  end;

  GKVoiceChat = interface(NSObject)
    ['{8CCECE1D-C940-4355-A5D1-FB0E8FB9B078}']
    procedure start; cdecl;
    procedure stop; cdecl;
    procedure setPlayer(player: GKPlayer; muted: Boolean); cdecl;
    procedure setPlayerVoiceChatStateDidChangeHandler
      (playerVoiceChatStateDidChangeHandler
      : TGameKitPlayerVoiceChatStateDidChangeHandler); cdecl;
    function playerVoiceChatStateDidChangeHandler
      : TGameKitPlayerVoiceChatStateDidChangeHandler; cdecl;
    function name: NSString; cdecl;
    procedure setActive(active: Boolean); cdecl;
    function isActive: Boolean; cdecl;
    procedure setVolume(volume: Single); cdecl;
    function volume: Single; cdecl;
    function players: NSArray; cdecl;
    procedure setPlayerStateUpdateHandler(playerStateUpdateHandler
      : TGameKitPlayerStateUpdateHandler); cdecl;
    function playerStateUpdateHandler: TGameKitPlayerStateUpdateHandler; cdecl;
    function playerIDs: NSArray; cdecl;
    procedure setMute(isMuted: Boolean; forPlayer: NSString); cdecl;
  end;

  TGKVoiceChat = class(TOCGenericImport<GKVoiceChatClass, GKVoiceChat>)
  end;

  PGKVoiceChat = Pointer;

  GKMatchmakerViewControllerClass = interface(UINavigationControllerClass)
    ['{44B6271D-72AF-4DDB-93D7-4A574149EB7E}']
  end;

  GKMatchmakerViewController = interface(UINavigationController)
    ['{3AC7B041-7B21-45F4-92EE-057111429635}']
    procedure setMatchmakerDelegate(matchmakerDelegate: Pointer); cdecl;
    function matchmakerDelegate: Pointer; cdecl;
    function matchRequest: GKMatchRequest; cdecl;
    procedure setHosted(hosted: Boolean); cdecl;
    function isHosted: Boolean; cdecl;
    procedure setMatchmakingMode(matchmakingMode: GKMatchmakingMode); cdecl;
    function matchmakingMode: GKMatchmakingMode; cdecl;
    procedure setCanStartWithMinimumPlayers(canStartWithMinimumPlayers
      : Boolean); cdecl;
    function canStartWithMinimumPlayers: Boolean; cdecl;
    function initWithMatchRequest(request: GKMatchRequest): Pointer; cdecl;
    function initWithInvite(invite: GKInvite): Pointer; cdecl;
    procedure addPlayersToMatch(match: GKMatch); cdecl;
    [MethodName('setHostedPlayer:didConnect:')]
    procedure setHostedPlayerDidConnect(player: GKPlayer;
      didConnect: Boolean); cdecl;
    procedure setDefaultInvitationMessage(defaultInvitationMessage
      : NSString); cdecl;
    function defaultInvitationMessage: NSString; cdecl;
    [MethodName('setHostedPlayer:connected:')]
    procedure setHostedPlayerConnected(playerID: NSString;
      connected: Boolean); cdecl;
    procedure setHostedPlayerReady(playerID: NSString); cdecl;
  end;

  TGKMatchmakerViewController = class
    (TOCGenericImport<GKMatchmakerViewControllerClass,
    GKMatchmakerViewController>)
  end;

  PGKMatchmakerViewController = Pointer;

  GKNotificationBannerClass = interface(NSObjectClass)
    ['{B54313A5-31F1-4CE9-9836-73BCD12E1334}']
    [MethodName('showBannerWithTitle:message:completionHandler:')]
    { class } procedure showBannerWithTitleMessageCompletionHandler
      (title: NSString; message: NSString;
      completionHandler: TGameKitHandler); cdecl;
    [MethodName('showBannerWithTitle:message:duration:completionHandler:')]
    { class } procedure showBannerWithTitleMessageDurationCompletionHandler
      (title: NSString; message: NSString; duration: NSTimeInterval;
      completionHandler: TGameKitHandler); cdecl;
  end;

  GKNotificationBanner = interface(NSObject)
    ['{D2E257D5-EB24-4222-A2B8-A8590AEB0CC4}']
  end;

  TGKNotificationBanner = class(TOCGenericImport<GKNotificationBannerClass,
    GKNotificationBanner>)
  end;

  PGKNotificationBanner = Pointer;

  GKSessionClass = interface(NSObjectClass)
    ['{7E9653CE-D568-4F4F-A02E-36105C596648}']
  end;

  GKSession = interface(NSObject)
    ['{0441CE00-3F59-4170-BC94-E08F31B69363}']
    function initWithSessionID(sessionID: NSString; displayName: NSString;
      sessionMode: GKSessionMode): Pointer; cdecl;
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    function sessionID: NSString; cdecl;
    function displayName: NSString; cdecl;
    function sessionMode: GKSessionMode; cdecl;
    function peerID: NSString; cdecl;
    procedure setAvailable(available: Boolean); cdecl;
    function isAvailable: Boolean; cdecl;
    procedure setDisconnectTimeout(disconnectTimeout: NSTimeInterval); cdecl;
    function disconnectTimeout: NSTimeInterval; cdecl;
    function displayNameForPeer(peerID: NSString): NSString; cdecl;
    function sendData(data: NSData; toPeers: NSArray;
      withDataMode: GKSendDataMode; error: NSError): Boolean; cdecl;
    function sendDataToAllPeers(data: NSData; withDataMode: GKSendDataMode;
      error: NSError): Boolean; cdecl;
    procedure setDataReceiveHandler(handler: Pointer;
      withContext: Pointer); cdecl;
    procedure connectToPeer(peerID: NSString;
      withTimeout: NSTimeInterval); cdecl;
    procedure cancelConnectToPeer(peerID: NSString); cdecl;
    function acceptConnectionFromPeer(peerID: NSString; error: NSError)
      : Boolean; cdecl;
    procedure denyConnectionFromPeer(peerID: NSString); cdecl;
    procedure disconnectPeerFromAllPeers(peerID: NSString); cdecl;
    procedure disconnectFromAllPeers; cdecl;
    function peersWithConnectionState(state: GKPeerConnectionState)
      : NSArray; cdecl;
  end;

  TGKSession = class(TOCGenericImport<GKSessionClass, GKSession>)
  end;

  PGKSession = Pointer;

  GKVoiceChatServiceClass = interface(NSObjectClass)
    ['{258BE51E-4E8C-4AAA-A36C-47BFE120FFB1}']
    { class } function defaultVoiceChatService: GKVoiceChatService; cdecl;
    { class } function isVoIPAllowed: Boolean; cdecl;
  end;

  GKVoiceChatService = interface(NSObject)
    ['{5828357A-6016-4622-8770-6DA1E0E74EE3}']
    procedure setClient(client: Pointer); cdecl;
    function client: Pointer; cdecl;
    function startVoiceChatWithParticipantID(participantID: NSString;
      error: NSError): Boolean; cdecl;
    procedure stopVoiceChatWithParticipantID(participantID: NSString); cdecl;
    function acceptCallID(callID: NSInteger; error: NSError): Boolean; cdecl;
    procedure denyCallID(callID: NSInteger); cdecl;
    procedure receivedRealTimeData(audio: NSData;
      fromParticipantID: NSString); cdecl;
    procedure receivedData(arbitraryData: NSData;
      fromParticipantID: NSString); cdecl;
    procedure setMicrophoneMuted(microphoneMuted: Boolean); cdecl;
    function isMicrophoneMuted: Boolean; cdecl;
    procedure setRemoteParticipantVolume(remoteParticipantVolume
      : Single); cdecl;
    function remoteParticipantVolume: Single; cdecl;
    procedure setOutputMeteringEnabled(outputMeteringEnabled: Boolean); cdecl;
    function isOutputMeteringEnabled: Boolean; cdecl;
    procedure setInputMeteringEnabled(inputMeteringEnabled: Boolean); cdecl;
    function isInputMeteringEnabled: Boolean; cdecl;
    function outputMeterLevel: Single; cdecl;
    function inputMeterLevel: Single; cdecl;
  end;

  TGKVoiceChatService = class(TOCGenericImport<GKVoiceChatServiceClass,
    GKVoiceChatService>)
  end;

  PGKVoiceChatService = Pointer;

  GKPeerPickerControllerClass = interface(NSObjectClass)
    ['{3F36A945-28F2-4BE7-BD65-17998B89F5FB}']
  end;

  GKPeerPickerController = interface(NSObject)
    ['{DC64AC69-A15D-4156-BEE2-35CF2DB07E72}']
    procedure setConnectionTypesMask(connectionTypesMask
      : GKPeerPickerConnectionType); cdecl;
    function connectionTypesMask: GKPeerPickerConnectionType; cdecl;
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    procedure show; cdecl;
    procedure dismiss; cdecl;
    function isVisible: Boolean; cdecl;
  end;

  TGKPeerPickerController = class(TOCGenericImport<GKPeerPickerControllerClass,
    GKPeerPickerController>)
  end;

  PGKPeerPickerController = Pointer;

  GKTurnBasedMatchmakerViewControllerClass = interface
    (UINavigationControllerClass)
    ['{005E1F4C-72F0-48B4-A961-7E1978138FAA}']
  end;

  GKTurnBasedMatchmakerViewController = interface(UINavigationController)
    ['{74C246FA-9AC2-4143-9266-2F4D0FAFDCF7}']
    procedure setTurnBasedMatchmakerDelegate(turnBasedMatchmakerDelegate
      : Pointer); cdecl;
    function turnBasedMatchmakerDelegate: Pointer; cdecl;
    procedure setShowExistingMatches(showExistingMatches: Boolean); cdecl;
    function showExistingMatches: Boolean; cdecl;
    procedure setMatchmakingMode(matchmakingMode: GKMatchmakingMode); cdecl;
    function matchmakingMode: GKMatchmakingMode; cdecl;
    function initWithMatchRequest(request: GKMatchRequest): Pointer; cdecl;
  end;

  TGKTurnBasedMatchmakerViewController = class
    (TOCGenericImport<GKTurnBasedMatchmakerViewControllerClass,
    GKTurnBasedMatchmakerViewController>)
  end;

  PGKTurnBasedMatchmakerViewController = Pointer;

  // ===== Protocol declarations =====

  GKGameCenterControllerDelegate = interface(IObjectiveC)
    ['{43A3A0D8-FCEF-4126-9CED-18520A25F149}']
    procedure gameCenterViewControllerDidFinish(gameCenterViewController
      : GKGameCenterViewController); cdecl;
  end;

  GKAchievementViewControllerDelegate = interface(IObjectiveC)
    ['{C881F48B-D36D-48AF-BAA8-502698FFAC53}']
    procedure achievementViewControllerDidFinish(viewController
      : GKAchievementViewController); cdecl;
  end;

  GKChallengeEventHandlerDelegate = interface(IObjectiveC)
    ['{96844CEA-75F9-4E00-8255-4E2DF9F55858}']
    procedure localPlayerDidSelectChallenge(challenge: GKChallenge); cdecl;
    function shouldShowBannerForLocallyReceivedChallenge(challenge: GKChallenge)
      : Boolean; cdecl;
    procedure localPlayerDidReceiveChallenge(challenge: GKChallenge); cdecl;
    function shouldShowBannerForLocallyCompletedChallenge
      (challenge: GKChallenge): Boolean; cdecl;
    procedure localPlayerDidCompleteChallenge(challenge: GKChallenge); cdecl;
    function shouldShowBannerForRemotelyCompletedChallenge
      (challenge: GKChallenge): Boolean; cdecl;
    procedure remotePlayerDidCompleteChallenge(challenge: GKChallenge); cdecl;
  end;

  GKChallengeListener = interface(IObjectiveC)
    ['{2B81F59E-13E7-489F-8F1C-8FE571F0AB47}']
    [MethodName('player:wantsToPlayChallenge:')]
    procedure playerWantsToPlayChallenge(player: GKPlayer;
      wantsToPlayChallenge: GKChallenge); cdecl;
    [MethodName('player:didReceiveChallenge:')]
    procedure playerDidReceiveChallenge(player: GKPlayer;
      didReceiveChallenge: GKChallenge); cdecl;
    [MethodName('player:didCompleteChallenge:issuedByFriend:')]
    procedure playerDidCompleteChallengeIssuedByFriend(player: GKPlayer;
      didCompleteChallenge: GKChallenge; issuedByFriend: GKPlayer); cdecl;
    [MethodName('player:issuedChallengeWasCompleted:byFriend:')]
    procedure playerIssuedChallengeWasCompletedByFriend(player: GKPlayer;
      issuedChallengeWasCompleted: GKChallenge; byFriend: GKPlayer); cdecl;
  end;

  GKFriendRequestComposeViewControllerDelegate = interface(IObjectiveC)
    ['{DC144D34-F3BD-4804-8C6A-D03D96BFCA08}']
    procedure friendRequestComposeViewControllerDidFinish(viewController
      : GKFriendRequestComposeViewController); cdecl;
  end;

  GKGameSessionEventListener = interface(IObjectiveC)
    ['{CA4AC4A9-FCA5-48DB-880B-32C542FB695B}']
    [MethodName('session:didAddPlayer:')]
    procedure sessionDidAddPlayer(session: GKGameSession;
      didAddPlayer: GKCloudPlayer); cdecl;
    [MethodName('session:didRemovePlayer:')]
    procedure sessionDidRemovePlayer(session: GKGameSession;
      didRemovePlayer: GKCloudPlayer); cdecl;
    [MethodName('session:player:didChangeConnectionState:')]
    procedure sessionPlayerDidChangeConnectionState(session: GKGameSession;
      player: GKCloudPlayer;
      didChangeConnectionState: GKConnectionState); cdecl;
    [MethodName('session:player:didSaveData:')]
    procedure sessionPlayerDidSaveData(session: GKGameSession;
      player: GKCloudPlayer; didSaveData: NSData); cdecl;
    [MethodName('session:didReceiveData:fromPlayer:')]
    procedure sessionDidReceiveDataFromPlayer(session: GKGameSession;
      didReceiveData: NSData; fromPlayer: GKCloudPlayer); cdecl;
    [MethodName('session:didReceiveMessage:withData:fromPlayer:')]
    procedure sessionDidReceiveMessageWithDataFromPlayer(session: GKGameSession;
      didReceiveMessage: NSString; withData: NSData;
      fromPlayer: GKCloudPlayer); cdecl;
  end;

  GKLeaderboardViewControllerDelegate = interface(IObjectiveC)
    ['{DCFEC995-149E-47D5-A7CB-E7F73FE0EBA4}']
    procedure leaderboardViewControllerDidFinish(viewController
      : GKLeaderboardViewController); cdecl;
  end;

  GKTurnBasedEventListener = interface(IObjectiveC)
    ['{7D01A742-A969-4BC8-ADBD-80B825884E3D}']
    [MethodName('player:didRequestMatchWithOtherPlayers:')]
    procedure playerDidRequestMatchWithOtherPlayers(player: GKPlayer;
      didRequestMatchWithOtherPlayers: NSArray); cdecl;
    [MethodName('player:receivedTurnEventForMatch:didBecomeActive:')]
    procedure playerReceivedTurnEventForMatchDidBecomeActive(player: GKPlayer;
      receivedTurnEventForMatch: GKTurnBasedMatch;
      didBecomeActive: Boolean); cdecl;
    [MethodName('player:matchEnded:')]
    procedure playerMatchEnded(player: GKPlayer;
      matchEnded: GKTurnBasedMatch); cdecl;
    [MethodName('player:receivedExchangeRequest:forMatch:')]
    procedure playerReceivedExchangeRequestForMatch(player: GKPlayer;
      receivedExchangeRequest: GKTurnBasedExchange;
      forMatch: GKTurnBasedMatch); cdecl;
    [MethodName('player:receivedExchangeCancellation:forMatch:')]
    procedure playerReceivedExchangeCancellationForMatch(player: GKPlayer;
      receivedExchangeCancellation: GKTurnBasedExchange;
      forMatch: GKTurnBasedMatch); cdecl;
    [MethodName
      ('player:receivedExchangeReplies:forCompletedExchange:forMatch:')]
    procedure playerReceivedExchangeRepliesForCompletedExchangeForMatch
      (player: GKPlayer; receivedExchangeReplies: NSArray;
      forCompletedExchange: GKTurnBasedExchange;
      forMatch: GKTurnBasedMatch); cdecl;
    [MethodName('player:wantsToQuitMatch:')]
    procedure playerWantsToQuitMatch(player: GKPlayer;
      wantsToQuitMatch: GKTurnBasedMatch); cdecl;
    [MethodName('player:didRequestMatchWithPlayers:')]
    procedure playerDidRequestMatchWithPlayers(player: GKPlayer;
      didRequestMatchWithPlayers: NSArray); cdecl;
  end;

  GKTurnBasedEventHandlerDelegate = interface(IObjectiveC)
    ['{93484429-C841-4AC7-B25C-BDA36A88DA98}']
    procedure handleInviteFromGameCenter(playersToInvite: NSArray); cdecl;
    [MethodName('handleTurnEventForMatch:didBecomeActive:')]
    procedure handleTurnEventForMatchDidBecomeActive(match: GKTurnBasedMatch;
      didBecomeActive: Boolean); cdecl;
    [MethodName('handleTurnEventForMatch:')]
    procedure handleTurnEventForMatch(match: GKTurnBasedMatch); cdecl;
    procedure handleMatchEnded(match: GKTurnBasedMatch); cdecl;
  end;

  GKInviteEventListener = interface(IObjectiveC)
    ['{CEE2BC26-D800-4D4B-95CF-F7F50EB42D08}']
    [MethodName('player:didAcceptInvite:')]
    procedure playerDidAcceptInvite(player: GKPlayer;
      didAcceptInvite: GKInvite); cdecl;
    [MethodName('player:didRequestMatchWithRecipients:')]
    procedure playerDidRequestMatchWithRecipients(player: GKPlayer;
      didRequestMatchWithRecipients: NSArray); cdecl;
    [MethodName('player:didRequestMatchWithPlayers:')]
    procedure playerDidRequestMatchWithPlayers(player: GKPlayer;
      didRequestMatchWithPlayers: NSArray); cdecl;
  end;

  GKSavedGameListener = interface(IObjectiveC)
    ['{A38437C1-5EA4-4062-8F29-3D3EC23AAF5E}']
    [MethodName('player:didModifySavedGame:')]
    procedure playerDidModifySavedGame(player: GKPlayer;
      didModifySavedGame: GKSavedGame); cdecl;
    [MethodName('player:hasConflictingSavedGames:')]
    procedure playerHasConflictingSavedGames(player: GKPlayer;
      hasConflictingSavedGames: NSArray); cdecl;
  end;

  GKLocalPlayerListener = interface(IObjectiveC)
    ['{70689D1E-7C3A-47D5-8279-7B30A861E278}']
  end;

  GKMatchDelegate = interface(IObjectiveC)
    ['{90A0711E-F770-4C2B-82A4-A8E2281C798D}']
    [MethodName('match:didReceiveData:fromRemotePlayer:')]
    procedure matchDidReceiveDataFromRemotePlayer(match: GKMatch;
      didReceiveData: NSData; fromRemotePlayer: GKPlayer); cdecl;
    [MethodName('match:didReceiveData:forRecipient:fromRemotePlayer:')]
    procedure matchDidReceiveDataForRecipientFromRemotePlayer(match: GKMatch;
      didReceiveData: NSData; forRecipient: GKPlayer;
      fromRemotePlayer: GKPlayer); cdecl;
    [MethodName('match:player:didChangeConnectionState:')]
    procedure matchPlayerDidChangeConnectionState(match: GKMatch;
      player: GKPlayer; didChangeConnectionState
      : GKPlayerConnectionState); cdecl;
    [MethodName('match:didFailWithError:')]
    procedure matchDidFailWithError(match: GKMatch;
      didFailWithError: NSError); cdecl;
    [MethodName('match:shouldReinviteDisconnectedPlayer:')]
    function matchShouldReinviteDisconnectedPlayer(match: GKMatch;
      shouldReinviteDisconnectedPlayer: GKPlayer): Boolean; cdecl;
    [MethodName('match:didReceiveData:fromPlayer:')]
    procedure matchDidReceiveDataFromPlayer(match: GKMatch;
      didReceiveData: NSData; fromPlayer: NSString); cdecl;
    [MethodName('match:player:didChangeState:')]
    procedure matchPlayerDidChangeState(match: GKMatch; player: NSString;
      didChangeState: GKPlayerConnectionState); cdecl;
    [MethodName('match:shouldReinvitePlayer:')]
    function matchShouldReinvitePlayer(match: GKMatch;
      shouldReinvitePlayer: NSString): Boolean; cdecl;
  end;

  GKMatchmakerViewControllerDelegate = interface(IObjectiveC)
    ['{496090D9-400A-44FA-904A-7D14A31AFBBD}']
    procedure matchmakerViewControllerWasCancelled(viewController
      : GKMatchmakerViewController); cdecl;
    [MethodName('matchmakerViewController:didFailWithError:')]
    procedure matchmakerViewControllerDidFailWithError(viewController
      : GKMatchmakerViewController; didFailWithError: NSError); cdecl;
    [MethodName('matchmakerViewController:didFindMatch:')]
    procedure matchmakerViewControllerDidFindMatch(viewController
      : GKMatchmakerViewController; didFindMatch: GKMatch); cdecl;
    [MethodName('matchmakerViewController:didFindHostedPlayers:')]
    procedure matchmakerViewControllerDidFindHostedPlayers(viewController
      : GKMatchmakerViewController; didFindHostedPlayers: NSArray); cdecl;
    [MethodName('matchmakerViewController:hostedPlayerDidAccept:')]
    procedure matchmakerViewControllerHostedPlayerDidAccept(viewController
      : GKMatchmakerViewController; hostedPlayerDidAccept: GKPlayer); cdecl;
    [MethodName('matchmakerViewController:didFindPlayers:')]
    procedure matchmakerViewControllerDidFindPlayers(viewController
      : GKMatchmakerViewController; didFindPlayers: NSArray); cdecl;
    [MethodName('matchmakerViewController:didReceiveAcceptFromHostedPlayer:')]
    procedure matchmakerViewControllerDidReceiveAcceptFromHostedPlayer
      (viewController: GKMatchmakerViewController;
      didReceiveAcceptFromHostedPlayer: NSString); cdecl;
  end;

  GKSessionDelegate = interface(IObjectiveC)
    ['{15D0E614-C88B-4D90-8FE7-ACC6D56FA667}']
    [MethodName('session:peer:didChangeState:')]
    procedure sessionPeerDidChangeState(session: GKSession; peer: NSString;
      didChangeState: GKPeerConnectionState); cdecl;
    [MethodName('session:didReceiveConnectionRequestFromPeer:')]
    procedure sessionDidReceiveConnectionRequestFromPeer(session: GKSession;
      didReceiveConnectionRequestFromPeer: NSString); cdecl;
    [MethodName('session:connectionWithPeerFailed:withError:')]
    procedure sessionConnectionWithPeerFailedWithError(session: GKSession;
      connectionWithPeerFailed: NSString; withError: NSError); cdecl;
    [MethodName('session:didFailWithError:')]
    procedure sessionDidFailWithError(session: GKSession;
      didFailWithError: NSError); cdecl;
  end;

  GKVoiceChatClient = interface(IObjectiveC)
    ['{E4105F11-7302-49C1-9B44-006A73AA6A58}']
    [MethodName('voiceChatService:sendData:toParticipantID:')]
    procedure voiceChatServiceSendDataToParticipantID(voiceChatService
      : GKVoiceChatService; sendData: NSData; toParticipantID: NSString); cdecl;
    function participantID: NSString; cdecl;
    [MethodName('voiceChatService:sendRealTimeData:toParticipantID:')]
    procedure voiceChatServiceSendRealTimeDataToParticipantID(voiceChatService
      : GKVoiceChatService; sendRealTimeData: NSData;
      toParticipantID: NSString); cdecl;
    [MethodName('voiceChatService:didStartWithParticipantID:')]
    procedure voiceChatServiceDidStartWithParticipantID(voiceChatService
      : GKVoiceChatService; didStartWithParticipantID: NSString); cdecl;
    [MethodName('voiceChatService:didNotStartWithParticipantID:error:')]
    procedure voiceChatServiceDidNotStartWithParticipantIDError(voiceChatService
      : GKVoiceChatService; didNotStartWithParticipantID: NSString;
      error: NSError); cdecl;
    [MethodName('voiceChatService:didStopWithParticipantID:error:')]
    procedure voiceChatServiceDidStopWithParticipantIDError(voiceChatService
      : GKVoiceChatService; didStopWithParticipantID: NSString;
      error: NSError); cdecl;
    [MethodName
      ('voiceChatService:didReceiveInvitationFromParticipantID:callID:')]
    procedure voiceChatServiceDidReceiveInvitationFromParticipantIDCallID
      (voiceChatService: GKVoiceChatService;
      didReceiveInvitationFromParticipantID: NSString;
      callID: NSInteger); cdecl;
  end;

  GKPeerPickerControllerDelegate = interface(IObjectiveC)
    ['{CB04952E-7BEE-4216-A7CB-B7657212F568}']
    [MethodName('peerPickerController:didSelectConnectionType:')]
    procedure peerPickerControllerDidSelectConnectionType
      (picker: GKPeerPickerController;
      didSelectConnectionType: GKPeerPickerConnectionType); cdecl;
    [MethodName('peerPickerController:sessionForConnectionType:')]
    function peerPickerControllerSessionForConnectionType
      (picker: GKPeerPickerController;
      sessionForConnectionType: GKPeerPickerConnectionType): GKSession; cdecl;
    [MethodName('peerPickerController:didConnectPeer:toSession:')]
    procedure peerPickerControllerDidConnectPeerToSession
      (picker: GKPeerPickerController; didConnectPeer: NSString;
      toSession: GKSession); cdecl;
    procedure peerPickerControllerDidCancel
      (picker: GKPeerPickerController); cdecl;
  end;

  GKTurnBasedMatchmakerViewControllerDelegate = interface(IObjectiveC)
    ['{910D62EB-D2CD-43D7-B660-53BB06745B91}']
    procedure turnBasedMatchmakerViewControllerWasCancelled(viewController
      : GKTurnBasedMatchmakerViewController); cdecl;
    [MethodName('turnBasedMatchmakerViewController:didFailWithError:')]
    procedure turnBasedMatchmakerViewControllerDidFailWithError
      (viewController: GKTurnBasedMatchmakerViewController;
      didFailWithError: NSError); cdecl;
    [MethodName('turnBasedMatchmakerViewController:didFindMatch:')]
    procedure turnBasedMatchmakerViewControllerDidFindMatch(viewController
      : GKTurnBasedMatchmakerViewController;
      didFindMatch: GKTurnBasedMatch); cdecl;
    [MethodName('turnBasedMatchmakerViewController:playerQuitForMatch:')]
    procedure turnBasedMatchmakerViewControllerPlayerQuitForMatch
      (viewController: GKTurnBasedMatchmakerViewController;
      playerQuitForMatch: GKTurnBasedMatch); cdecl;
  end;

  // ===== Exported string consts =====

function GKErrorDomain: NSString;
function GKPlayerIDNoLongerAvailable: NSString;
function GKPlayerDidChangeNotificationName: Pointer;
function GKGameSessionErrorDomain: NSString;
function GKTurnTimeoutDefault: Pointer;
function GKTurnTimeoutNone: Pointer;
function GKExchangeTimeoutDefault: Pointer;
function GKExchangeTimeoutNone: Pointer;
function GKPlayerAuthenticationDidChangeNotificationName: Pointer;
function GKVoiceChatServiceErrorDomain: NSString;
function GKSessionErrorDomain: NSString;


// ===== External functions =====

const
  libGameKit = '/System/Library/Frameworks/GameKit.framework/GameKit';

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  GameKitModule: THandle;

{$ENDIF IOS}

function GKErrorDomain: NSString;
begin
  Result := CocoaNSStringConst(libGameKit, 'GKErrorDomain');
end;

function GKPlayerIDNoLongerAvailable: NSString;
begin
  Result := CocoaNSStringConst(libGameKit, 'GKPlayerIDNoLongerAvailable');
end;

function GKGameSessionErrorDomain: NSString;
begin
  Result := CocoaNSStringConst(libGameKit, 'GKGameSessionErrorDomain');
end;

function GKVoiceChatServiceErrorDomain: NSString;
begin
  Result := CocoaNSStringConst(libGameKit, 'GKVoiceChatServiceErrorDomain');
end;

function GKSessionErrorDomain: NSString;
begin
  Result := CocoaNSStringConst(libGameKit, 'GKSessionErrorDomain');
end;

function GKPlayerDidChangeNotificationName: Pointer;
begin
  Result := CocoaPointerConst(libGameKit, 'GKPlayerDidChangeNotificationName');
end;

function GKTurnTimeoutDefault: Pointer;
begin
  Result := CocoaPointerConst(libGameKit, 'GKTurnTimeoutDefault');
end;

function GKTurnTimeoutNone: Pointer;
begin
  Result := CocoaPointerConst(libGameKit, 'GKTurnTimeoutNone');
end;

function GKExchangeTimeoutDefault: Pointer;
begin
  Result := CocoaPointerConst(libGameKit, 'GKExchangeTimeoutDefault');
end;

function GKExchangeTimeoutNone: Pointer;
begin
  Result := CocoaPointerConst(libGameKit, 'GKExchangeTimeoutNone');
end;

function GKPlayerAuthenticationDidChangeNotificationName: Pointer;
begin
  Result := CocoaPointerConst(libGameKit,
    'GKPlayerAuthenticationDidChangeNotificationName');
end;

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

GameKitModule := dlopen(MarshaledAString(libGameKit), RTLD_LAZY);

finalization

dlclose(GameKitModule);
{$ENDIF IOS}

end.
