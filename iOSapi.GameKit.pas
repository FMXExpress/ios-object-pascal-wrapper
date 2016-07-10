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
  Macapi.Foundation,
  Macapi.Mach,
  Macapi.ObjCRuntime,
  Macapi.ObjectiveC,
  Macapi.QuartzCore,
  iOSapi.CocoaTypes,
  iOSapi.Foundation,
  iOSapi.UIKit;

const
  GKLeaderboardTimeScopeToday = 0;
  GKLeaderboardTimeScopeWeek = 1;
  GKLeaderboardTimeScopeAllTime = 2;
  GKLeaderboardPlayerScopeGlobal = 0;
  GKLeaderboardPlayerScopeFriendsOnly = 1;
  GKGameCenterViewControllerStateDefault = -1;
  GKGameCenterViewControllerStateLeaderboards = 0;
  GKGameCenterViewControllerStateAchievements = 1;
  GKGameCenterViewControllerStateChallenges = 2;
  GKChallengeStateInvalid = 0;
  GKChallengeStatePending = 1;
  GKChallengeStateCompleted = 2;
  GKChallengeStateDeclined = 3;
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
  GKPhotoSizeSmall = 0;
  GKPhotoSizeNormal = 1;
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
  GKMatchSendDataReliable = 0;
  GKMatchSendDataUnreliable = 1;
  GKPlayerStateUnknown = 0;
  GKPlayerStateConnected = 1;
  GKPlayerStateDisconnected = 2;
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
  GKPlayer = interface;
  GKAchievement = interface;
  GKAchievementDescription = interface;
  GKScore = interface;
  GKLeaderboard = interface;
  GKGameCenterControllerDelegate = interface;
  GKGameCenterViewController = interface;
  GKAchievementViewControllerDelegate = interface;
  GKAchievementViewController = interface;
  GKChallenge = interface;
  GKScoreChallenge = interface;
  GKAchievementChallenge = interface;
  GKChallengeEventHandlerDelegate = interface;
  GKChallengeEventHandler = interface;
  GKChallengeListener = interface;
  GKFriendRequestComposeViewControllerDelegate = interface;
  GKFriendRequestComposeViewController = interface;
  GKLeaderboardSet = interface;
  GKLeaderboardViewControllerDelegate = interface;
  GKLeaderboardViewController = interface;
  GKLocalPlayer = interface;
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
  TGameKitCompletionHandler = procedure(param1: NSArray; param2: NSError)
    of object;
  TGameKitCompletionHandler1 = procedure(param1: NSError) of object;
  NSInteger = Integer;
  TGameKitCompletionHandler2 = procedure(param1: UIImage; param2: NSError)
    of object;
  GKLeaderboardTimeScope = NSInteger;
  GKLeaderboardPlayerScope = NSInteger;
  NSUInteger = Cardinal;
  NSRange = _NSRange = record location: NSUInteger;
length:
NSUInteger;
end;
P_NSRange = ^_NSRange;;
TGameKitCompletionHandler3 =
procedure(param1: NSArray; param2: NSArray; param3: NSError) of object;
GKGameCenterViewControllerState = NSInteger;
GKChallengeComposeCompletionBlock =
procedure(param1: UIViewController; param2: Boolean; param3: NSArray) of object;
GKChallengeState = NSInteger;
GKErrorCode = NSInteger;
GKPhotoSize = NSInteger;
GKTurnBasedMatchStatus = NSInteger;
GKTurnBasedParticipantStatus = NSInteger;
GKTurnBasedMatchOutcome = NSInteger;
NSTimeInterval = Double;
TGameKitWithCompletionHandler =
procedure(param1: GKTurnBasedMatch; param2: NSError) of object;
TGameKitCompletionHandler4 =
procedure(param1: NSData; param2: NSError) of object;
TGameKitCompletionHandler5 =
procedure(param1: GKTurnBasedExchange; param2: NSError) of object;
GKTurnBasedExchangeStatus = Int8;
GKInviteRecipientResponse = NSInteger;
GKInviteeResponse = GKInviteRecipientResponse;
TGameKitRecipientResponseHandler =
procedure(param1: GKPlayer; param2: GKInviteRecipientResponse) of object;
TGameKitInviteeResponseHandler =
procedure(param1: NSString; param2: GKInviteeResponse) of object;
GKMatchType = NSUInteger;
TGameKitCompletionHandler6 =
procedure(param1: GKMatch; param2: NSError) of object;
TGameKitWithCompletionHandler1 =
procedure(param1: NSInteger; param2: NSError) of object;
TGameKitReachableHandler =
procedure(param1: GKPlayer; param2: Boolean) of object;
TGameKitInviteHandler =
procedure(param1: GKInvite; param2: NSArray) of object;
TGameKitReachableHandler1 =
procedure(param1: NSString; param2: Boolean) of object;
TGameKitAuthenticateHandler =
procedure(param1: UIViewController; param2: NSError) of object;
TGameKitCompletionHandler7 =
procedure(param1: NSString; param2: NSError) of object;
TGameKitCompletionHandler8 =
procedure(param1: NSURL; param2: NSData; param3: NSData; param4: UInt64;
  param5: NSError) of object;
GKMatchSendDataMode = NSInteger;
GKPlayerConnectionState = NSInteger;
TGameKitCompletionHandler9 =
procedure(param1: GKPlayer) of object;
TGameKitCompletionHandler10 =
procedure(param1: NSString) of object;
TGameKitCompletionHandler11 =
procedure() of object;
GKSendDataMode = Integer;
GKSessionMode = Integer;
GKPeerConnectionState = Integer;
GKVoiceChatServiceError = Integer;
GKPeerPickerConnectionType = NSUInteger;
TGameKitCompletionHandler12 =
procedure(param1: GKSavedGame; param2: NSError) of object;
GKSessionError = Integer;
GKVoiceChatPlayerState = NSInteger;
TGameKitPlayerVoiceChatStateDidChangeHandler =
procedure(param1: GKPlayer; param2: GKVoiceChatPlayerState) of object;
TGameKitPlayerStateUpdateHandler =
procedure(param1: NSString; param2: GKVoiceChatPlayerState) of object;
// ===== Interface declarations =====

GKPlayerClass = interface(NSObjectClass)
  ['{7B63EAED-975E-4B7B-8593-7DECC66D0C98}']
{ class } procedure loadPlayersForIdentifiers(identifiers: NSArray;
  withCompletionHandler: TGameKitCompletionHandler);
cdecl;

{ class } function anonymousGuestPlayerWithIdentifier(guestIdentifier: NSString)
  : Pointer { instancetype }; cdecl;
end;
GKPlayer = interface(NSObject)['{DD9B264A-81A1-4606-89F6-FA92EA4634BD}']
function playerID: NSString;
cdecl;

function displayName: NSString; cdecl;
  function alias: NSString; cdecl;
    function guestIdentifier: NSString; cdecl;
      procedure loadPhotoForSize(size: GKPhotoSize;
        withCompletionHandler: TGameKitCompletionHandler2); cdecl;
        function isFriend: Boolean; cdecl;
        end;

    TGKPlayer = class(TOCGenericImport<GKPlayerClass, GKPlayer>)
    end;
PGKPlayer = Pointer;

GKAchievementClass = interface(NSObjectClass)
  ['{B79F5CC0-E3B8-4CFE-8618-818901A3BAE9}']
{ class } procedure loadAchievementsWithCompletionHandler(completionHandler
  : TGameKitCompletionHandler);
cdecl;
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
  GKAchievement = interface(NSObject)['{3CECE752-0716-4977-922E-56FF68E24520}']
    [MethodName('initWithIdentifier:')]
  function initWithIdentifier(identifier: NSString): Pointer { instancetype };
  cdecl;
  [MethodName('initWithIdentifier:player:')]
    function initWithIdentifierPlayer(identifier: NSString; player: GKPlayer)
      : Pointer { instancetype }; cdecl;
      procedure setIdentifier(identifier: NSString); cdecl;
        function identifier: NSString; cdecl;
          procedure setPercentComplete(percentComplete: Double); cdecl;
            function percentComplete: Double; cdecl;
              function isCompleted: Boolean; cdecl;
                function lastReportedDate: NSDate; cdecl;
                  procedure setShowsCompletionBanner(showsCompletionBanner
                    : Boolean); cdecl;
                    function showsCompletionBanner: Boolean; cdecl;
                      function player: GKPlayer; cdecl;
                        procedure reportAchievementWithCompletionHandler
                          (completionHandler
                          : TGameKitCompletionHandler1); cdecl;
                        [MethodName('initWithIdentifier:forPlayer:')]
                          function initWithIdentifierForPlayer
                            (identifier: NSString; forPlayer: NSString)
                            : Pointer { instancetype }; cdecl;
                            function isHidden: Boolean; cdecl;
                              function playerID: NSString; cdecl;
                                function challengeComposeControllerWithMessage
                                  (message: NSString; players: NSArray;
                                  completionHandler
                                  : GKChallengeComposeCompletionBlock)
                                  : UIViewController; cdecl;
                                  procedure issueChallengeToPlayers
                                    (playerIDs: NSArray;
                                    message: NSString); cdecl;
                                    procedure selectChallengeablePlayers
                                      (players: NSArray;
                                      withCompletionHandler
                                      : TGameKitCompletionHandler); cdecl;
                                      procedure selectChallengeablePlayerIDs
                                        (playerIDs: NSArray;
                                        withCompletionHandler
                                        : TGameKitCompletionHandler); cdecl;
                                        function challengeComposeControllerWithPlayers
                                        (playerIDs: NSArray; message: NSString;
                                        completionHandler
                                        : GKChallengeComposeCompletionBlock)
                                        : UIViewController; cdecl;
                                        end;

                                    TGKAchievement = class
                                      (TOCGenericImport<GKAchievementClass,
                                      GKAchievement>)
                                    end;
                                PGKAchievement = Pointer;

                                GKAchievementDescriptionClass = interface
                                  (NSObjectClass)
                                  ['{0F38DB78-2D19-42A5-90BF-A171D7D5C35A}']
                                { class } procedure
                                  loadAchievementDescriptionsWithCompletionHandler
                                  (completionHandler
                                  : TGameKitCompletionHandler);
                                cdecl;
                                { class } function incompleteAchievementImage
                                    : UIImage; cdecl;
                                  { class } function
                                      placeholderCompletedAchievementImage
                                      : UIImage; cdecl;
                                    end;
                                GKAchievementDescription = interface(NSObject)
                                  ['{8BEDC238-5494-48E2-9309-C0C1D6963761}']
                                function identifier: NSString;
                                cdecl;
                                  function groupIdentifier: NSString; cdecl;
                                    function title: NSString; cdecl;
                                      function achievedDescription
                                        : NSString; cdecl;
                                        function unachievedDescription
                                        : NSString; cdecl;
                                        function maximumPoints
                                        : NSInteger; cdecl;
                                        function isHidden: Boolean; cdecl;
                                        function isReplayable: Boolean; cdecl;
                                        function image: UIImage; cdecl;
                                        procedure loadImageWithCompletionHandler
                                        (completionHandler
                                        : TGameKitCompletionHandler2); cdecl;
                                        end;

                                        TGKAchievementDescription = class
                                        (TOCGenericImport<
                                        GKAchievementDescriptionClass,
                                        GKAchievementDescription>)
                                        end;
                                        PGKAchievementDescription = Pointer;

                                        GKScoreClass = interface(NSObjectClass)
                                        ['{D7AF4297-C34C-4BBF-9B50-C091F8C70390}']
                                        [MethodName
                                        ('reportScores:withCompletionHandler:')]
                                        { class } procedure
                                        reportScoresWithCompletionHandler
                                        (scores: NSArray;
                                        withCompletionHandler
                                        : TGameKitCompletionHandler1);
                                        cdecl;
                                        [MethodName
                                        ('reportScores:withEligibleChallenges:withCompletionHandler:')
                                        ]
                                        { class } procedure
                                        reportScoresWithEligibleChallengesWithCompletionHandler
                                        (scores: NSArray;
                                        withEligibleChallenges: NSArray;
                                        withCompletionHandler
                                        : TGameKitCompletionHandler1); cdecl;
                                        end;
                                        GKScore = interface(NSObject)
                                        ['{10F8ED9D-E384-4DE8-AF6C-1EA31FEFE94D}']
                                        [MethodName
                                        ('initWithLeaderboardIdentifier:')]
                                        function initWithLeaderboardIdentifier
                                        (identifier: NSString)
                                        : Pointer { instancetype };
                                        cdecl;
                                        [MethodName
                                        ('initWithLeaderboardIdentifier:player:')
                                        ]
                                        function initWithLeaderboardIdentifierPlayer
                                        (identifier: NSString; player: GKPlayer)
                                        : Pointer { instancetype }; cdecl;
                                        procedure setValue(value: Int64); cdecl;
                                        function value: Int64; cdecl;
                                        function formattedValue
                                        : NSString; cdecl;
                                        procedure setLeaderboardIdentifier
                                        (leaderboardIdentifier
                                        : NSString); cdecl;
                                        function leaderboardIdentifier
                                        : NSString; cdecl;
                                        procedure setContext
                                        (context: UInt64); cdecl;
                                        function context: UInt64; cdecl;
                                        function date: NSDate; cdecl;
                                        function player: GKPlayer; cdecl;
                                        function rank: NSInteger; cdecl;
                                        procedure setShouldSetDefaultLeaderboard
                                        (shouldSetDefaultLeaderboard
                                        : Boolean); cdecl;
                                        function shouldSetDefaultLeaderboard
                                        : Boolean; cdecl;
                                        [MethodName
                                        ('initWithLeaderboardIdentifier:forPlayer:')
                                        ]
                                        function initWithLeaderboardIdentifierForPlayer
                                        (identifier: NSString;
                                        forPlayer: NSString)
                                        : Pointer { instancetype }; cdecl;
                                        procedure reportScoreWithCompletionHandler
                                        (completionHandler
                                        : TGameKitCompletionHandler1); cdecl;
                                        function initWithCategory
                                        (category: NSString)
                                        : Pointer { instancetype }; cdecl;
                                        function playerID: NSString; cdecl;
                                        procedure setCategory
                                        (category: NSString); cdecl;
                                        function category: NSString; cdecl;
                                        function challengeComposeControllerWithMessage
                                        (message: NSString; players: NSArray;
                                        completionHandler
                                        : GKChallengeComposeCompletionBlock)
                                        : UIViewController; cdecl;
                                        procedure issueChallengeToPlayers
                                        (playerIDs: NSArray;
                                        message: NSString); cdecl;
                                        function challengeComposeControllerWithPlayers
                                        (playerIDs: NSArray; message: NSString;
                                        completionHandler
                                        : GKChallengeComposeCompletionBlock)
                                        : UIViewController; cdecl;
                                        end;

                                        TGKScore = class
                                        (TOCGenericImport<
                                        GKScoreClass, GKScore>)
                                        end;
                                        PGKScore = Pointer;

                                        GKLeaderboardClass = interface
                                        (NSObjectClass)
                                        ['{B0297079-A0F2-499D-8D2E-DF7B1574F57A}']
                                        { class } procedure
                                        loadLeaderboardsWithCompletionHandler
                                        (completionHandler
                                        : TGameKitCompletionHandler);
                                        cdecl;
                                        { class } procedure
                                        loadCategoriesWithCompletionHandler
                                        (completionHandler
                                        : TGameKitCompletionHandler3); cdecl;
                                        { class } procedure
                                        setDefaultLeaderboard
                                        (leaderboardIdentifier: NSString;
                                        withCompletionHandler
                                        : TGameKitCompletionHandler1); cdecl;
                                        end;
                                        GKLeaderboard = interface(NSObject)
                                        ['{F4606F42-9158-457E-90E3-A2CE6CE1CDB6}']
                                        procedure setTimeScope
                                        (timeScope: GKLeaderboardTimeScope);
                                        cdecl;
                                        function timeScope
                                        : GKLeaderboardTimeScope; cdecl;
                                        procedure setPlayerScope
                                        (playerScope
                                        : GKLeaderboardPlayerScope); cdecl;
                                        function playerScope
                                        : GKLeaderboardPlayerScope; cdecl;
                                        procedure setIdentifier
                                        (identifier: NSString); cdecl;
                                        function identifier: NSString; cdecl;
                                        function title: NSString; cdecl;
                                        procedure setRange
                                        (range: NSRange); cdecl;
                                        function range: NSRange; cdecl;
                                        function scores: NSArray; cdecl;
                                        function maxRange: NSUInteger; cdecl;
                                        function localPlayerScore
                                        : GKScore; cdecl;
                                        function isLoading: Boolean; cdecl;
                                        function groupIdentifier
                                        : NSString; cdecl;
                                        function init
                                        : Pointer { instancetype }; cdecl;
                                        function initWithPlayers
                                        (players: NSArray)
                                        : Pointer { instancetype }; cdecl;
                                        procedure loadScoresWithCompletionHandler
                                        (completionHandler
                                        : TGameKitCompletionHandler); cdecl;
                                        procedure setCategory
                                        (category: NSString); cdecl;
                                        function category: NSString; cdecl;
                                        function initWithPlayerIDs
                                        (playerIDs: NSArray)
                                        : Pointer { instancetype }; cdecl;
                                        procedure loadImageWithCompletionHandler
                                        (completionHandler
                                        : TGameKitCompletionHandler2); cdecl;
                                        end;

                                        TGKLeaderboard = class
                                        (TOCGenericImport<GKLeaderboardClass,
                                        GKLeaderboard>)
                                        end;
                                        PGKLeaderboard = Pointer;

                                        GKGameCenterViewControllerClass =
                                        interface(UINavigationControllerClass)
                                        ['{4B048462-67A2-4E7E-AD83-5AD6AB4DB1AC}']
                                        end;
                                        GKGameCenterViewController = interface
                                        (UINavigationController)
                                        ['{56855187-0942-4F37-9EC7-1EB3081868C9}']
                                        procedure setGameCenterDelegate
                                        (gameCenterDelegate: Pointer);
                                        cdecl;
                                        function gameCenterDelegate
                                        : Pointer; cdecl;
                                        procedure setViewState
                                        (viewState
                                        : GKGameCenterViewControllerState);
                                        cdecl;
                                        function viewState
                                        : GKGameCenterViewControllerState;
                                        cdecl;
                                        procedure setLeaderboardTimeScope
                                        (leaderboardTimeScope
                                        : GKLeaderboardTimeScope); cdecl;
                                        function leaderboardTimeScope
                                        : GKLeaderboardTimeScope; cdecl;
                                        procedure setLeaderboardIdentifier
                                        (leaderboardIdentifier
                                        : NSString); cdecl;
                                        function leaderboardIdentifier
                                        : NSString; cdecl;
                                        procedure setLeaderboardCategory
                                        (leaderboardCategory: NSString); cdecl;
                                        function leaderboardCategory
                                        : NSString; cdecl;
                                        end;

                                        TGKGameCenterViewController = class
                                        (TOCGenericImport<
                                        GKGameCenterViewControllerClass,
                                        GKGameCenterViewController>)
                                        end;
                                        PGKGameCenterViewController = Pointer;

                                        GKAchievementViewControllerClass =
                                        interface(
                                        GKGameCenterViewControllerClass)
                                        ['{4D5DF72C-CF4E-426C-BB05-579EC9823B1A}']
                                        end;
                                        GKAchievementViewController = interface
                                        (GKGameCenterViewController)
                                        ['{1D3D05EE-FB9B-482B-B58A-154CC0B909C6}']
                                        procedure setAchievementDelegate
                                        (achievementDelegate: Pointer);
                                        cdecl;
                                        function achievementDelegate
                                        : Pointer; cdecl;
                                        end;

                                        TGKAchievementViewController = class
                                        (TOCGenericImport<
                                        GKAchievementViewControllerClass,
                                        GKAchievementViewController>)
                                        end;
                                        PGKAchievementViewController = Pointer;

                                        GKChallengeClass = interface
                                        (NSObjectClass)
                                        ['{44759DB3-60BD-4F16-8CE9-2624A4614B6E}']
                                        { class } procedure
                                        loadReceivedChallengesWithCompletionHandler
                                        (completionHandler
                                        : TGameKitCompletionHandler);
                                        cdecl;
                                        end;
                                        GKChallenge = interface(NSObject)
                                        ['{E1F07256-82C0-49E1-8CD6-25F8E24CC4A4}']
                                        procedure decline;
                                        cdecl;
                                        function issuingPlayerID
                                        : NSString; cdecl;
                                        function receivingPlayerID
                                        : NSString; cdecl;
                                        function issuingPlayer: GKPlayer; cdecl;
                                        function receivingPlayer
                                        : GKPlayer; cdecl;
                                        function state: GKChallengeState; cdecl;
                                        function issueDate: NSDate; cdecl;
                                        function completionDate: NSDate; cdecl;
                                        function message: NSString; cdecl;
                                        end;

                                        TGKChallenge = class
                                        (TOCGenericImport<GKChallengeClass,
                                        GKChallenge>)
                                        end;
                                        PGKChallenge = Pointer;

                                        GKScoreChallengeClass = interface
                                        (GKChallengeClass)
                                        ['{46EE85AA-5F70-4E0A-9613-EC2F1AE58C03}']
                                        end;
                                        GKScoreChallenge = interface
                                        (GKChallenge)
                                        ['{5735F6CA-BD5F-42F5-B2C8-569A3D32526F}']
                                        function score: GKScore;
                                        cdecl;
                                        end;

                                        TGKScoreChallenge = class
                                        (TOCGenericImport<GKScoreChallengeClass,
                                        GKScoreChallenge>)
                                        end;
                                        PGKScoreChallenge = Pointer;

                                        GKAchievementChallengeClass = interface
                                        (GKChallengeClass)
                                        ['{4F16B149-14A0-46C7-B590-55BBF01963E5}']
                                        end;
                                        GKAchievementChallenge = interface
                                        (GKChallenge)
                                        ['{C05B5A84-EE07-4B87-A4A3-1A4D97F61C79}']
                                        function achievement: GKAchievement;
                                        cdecl;
                                        end;

                                        TGKAchievementChallenge = class
                                        (TOCGenericImport<
                                        GKAchievementChallengeClass,
                                        GKAchievementChallenge>)
                                        end;
                                        PGKAchievementChallenge = Pointer;

                                        GKChallengeEventHandlerClass = interface
                                        (NSObjectClass)
                                        ['{7CF546F0-DD4F-4E6F-A6A4-AE7DD96749DD}']
                                        { class } function challengeEventHandler
                                        : GKChallengeEventHandler;
                                        cdecl;
                                        end;
                                        GKChallengeEventHandler = interface
                                        (NSObject)
                                        ['{697E6C28-D6EA-42EB-BAA5-DBC2603B22E5}']
                                        procedure setDelegate
                                        (delegate: Pointer);
                                        cdecl;
                                        function delegate: Pointer; cdecl;
                                        end;

                                        TGKChallengeEventHandler = class
                                        (TOCGenericImport<
                                        GKChallengeEventHandlerClass,
                                        GKChallengeEventHandler>)
                                        end;
                                        PGKChallengeEventHandler = Pointer;

                                        GKFriendRequestComposeViewControllerClass =
                                        interface(UINavigationControllerClass)
                                        ['{DC4ACA32-5C23-4BC1-9D39-4EA4AB2E961A}']
                                        { class } function maxNumberOfRecipients
                                        : NSUInteger;
                                        cdecl;
                                        end;
                                        GKFriendRequestComposeViewController =
                                        interface(UINavigationController)
                                        ['{D490A7CD-8CFE-4F51-81BF-133D72986183}']
                                        procedure setComposeViewDelegate
                                        (composeViewDelegate: Pointer);
                                        cdecl;
                                        function composeViewDelegate
                                        : Pointer; cdecl;
                                        procedure setMessage
                                        (message: NSString); cdecl;
                                        procedure addRecipientPlayers
                                        (players: NSArray); cdecl;
                                        procedure addRecipientsWithPlayerIDs
                                        (playerIDs: NSArray); cdecl;
                                        procedure addRecipientsWithEmailAddresses
                                        (emailAddresses: NSArray); cdecl;
                                        end;

                                        TGKFriendRequestComposeViewController =
                                        class(TOCGenericImport<
                                        GKFriendRequestComposeViewControllerClass,
                                        GKFriendRequestComposeViewController>)
                                        end;
                                        PGKFriendRequestComposeViewController =
                                        Pointer;

                                        GKLeaderboardSetClass = interface
                                        (NSObjectClass)
                                        ['{C7B489E8-3073-4016-8A7B-5785324427B0}']
                                        { class } procedure
                                        loadLeaderboardSetsWithCompletionHandler
                                        (completionHandler
                                        : TGameKitCompletionHandler);
                                        cdecl;
                                        end;
                                        GKLeaderboardSet = interface(NSObject)
                                        ['{D55B9D71-7A8B-470A-8D79-0C25091F5484}']
                                        function title: NSString;
                                        cdecl;
                                        function groupIdentifier
                                        : NSString; cdecl;
                                        procedure setIdentifier
                                        (identifier: NSString); cdecl;
                                        function identifier: NSString; cdecl;
                                        procedure loadLeaderboardsWithCompletionHandler
                                        (completionHandler
                                        : TGameKitCompletionHandler); cdecl;
                                        procedure loadImageWithCompletionHandler
                                        (completionHandler
                                        : TGameKitCompletionHandler2); cdecl;
                                        end;

                                        TGKLeaderboardSet = class
                                        (TOCGenericImport<GKLeaderboardSetClass,
                                        GKLeaderboardSet>)
                                        end;
                                        PGKLeaderboardSet = Pointer;

                                        GKLeaderboardViewControllerClass =
                                        interface(
                                        GKGameCenterViewControllerClass)
                                        ['{87F68486-CACB-4A9D-8ACA-8653ACA54279}']
                                        end;
                                        GKLeaderboardViewController = interface
                                        (GKGameCenterViewController)
                                        ['{3824E313-7969-477D-93F1-4EF069F6CA7E}']
                                        procedure setTimeScope
                                        (timeScope: GKLeaderboardTimeScope);
                                        cdecl;
                                        function timeScope
                                        : GKLeaderboardTimeScope; cdecl;
                                        procedure setCategory
                                        (category: NSString); cdecl;
                                        function category: NSString; cdecl;
                                        procedure setLeaderboardDelegate
                                        (leaderboardDelegate: Pointer); cdecl;
                                        function leaderboardDelegate
                                        : Pointer; cdecl;
                                        end;

                                        TGKLeaderboardViewController = class
                                        (TOCGenericImport<
                                        GKLeaderboardViewControllerClass,
                                        GKLeaderboardViewController>)
                                        end;
                                        PGKLeaderboardViewController = Pointer;

                                        GKLocalPlayerClass = interface
                                        (GKPlayerClass)
                                        ['{C03C001C-EE3E-4959-9365-FE7479E37FC1}']
                                        { class } function localPlayer
                                        : GKLocalPlayer;
                                        cdecl;
                                        end;
                                        GKLocalPlayer = interface(GKPlayer)
                                        ['{78E2ED8F-A23A-43BA-BD9F-5243B8733A77}']
                                        function isAuthenticated: Boolean;
                                        cdecl;
                                        function isUnderage: Boolean; cdecl;
                                        procedure setAuthenticateHandler
                                        (authenticateHandler
                                        : TGameKitAuthenticateHandler); cdecl;
                                        function authenticateHandler
                                        : TGameKitAuthenticateHandler; cdecl;
                                        procedure loadFriendPlayersWithCompletionHandler
                                        (completionHandler
                                        : TGameKitCompletionHandler); cdecl;
                                        procedure setDefaultLeaderboardIdentifier
                                        (leaderboardIdentifier: NSString;
                                        completionHandler
                                        : TGameKitCompletionHandler1); cdecl;
                                        procedure loadDefaultLeaderboardIdentifierWithCompletionHandler
                                        (completionHandler
                                        : TGameKitCompletionHandler7); cdecl;
                                        procedure generateIdentityVerificationSignatureWithCompletionHandler
                                        (completionHandler
                                        : TGameKitCompletionHandler8); cdecl;
                                        procedure registerListener
                                        (listener: Pointer); cdecl;
                                        procedure unregisterListener
                                        (listener: Pointer); cdecl;
                                        procedure unregisterAllListeners; cdecl;
                                        procedure setDefaultLeaderboardCategoryID
                                        (categoryID: NSString;
                                        completionHandler
                                        : TGameKitCompletionHandler1); cdecl;
                                        procedure loadDefaultLeaderboardCategoryIDWithCompletionHandler
                                        (completionHandler
                                        : TGameKitCompletionHandler7); cdecl;
                                        procedure loadFriendsWithCompletionHandler
                                        (completionHandler
                                        : TGameKitCompletionHandler); cdecl;
                                        procedure authenticateWithCompletionHandler
                                        (completionHandler
                                        : TGameKitCompletionHandler1); cdecl;
                                        function friends: NSArray; cdecl;
                                        procedure fetchSavedGamesWithCompletionHandler
                                        (handler: TGameKitCompletionHandler);
                                        cdecl;
                                        procedure saveGameData(data: NSData;
                                        withName: NSString;
                                        completionHandler
                                        : TGameKitCompletionHandler12); cdecl;
                                        procedure deleteSavedGamesWithName
                                        (name: NSString;
                                        completionHandler
                                        : TGameKitCompletionHandler1); cdecl;
                                        procedure resolveConflictingSavedGames
                                        (conflictingSavedGames: NSArray;
                                        withData: NSData;
                                        completionHandler
                                        : TGameKitCompletionHandler); cdecl;
                                        end;

                                        TGKLocalPlayer = class
                                        (TOCGenericImport<GKLocalPlayerClass,
                                        GKLocalPlayer>)
                                        end;
                                        PGKLocalPlayer = Pointer;

                                        GKMatchRequestClass = interface
                                        (NSObjectClass)
                                        ['{BA216B77-A256-4AD4-A412-DCC64D631B52}']
                                        { class } function
                                        maxPlayersAllowedForMatchOfType
                                        (matchType: GKMatchType): NSUInteger;
                                        cdecl;
                                        end;
                                        GKMatchRequest = interface(NSObject)
                                        ['{B3C3FDF0-02CA-4CEA-BEDB-BB7ED0100E19}']
                                        procedure setMinPlayers
                                        (minPlayers: NSUInteger);
                                        cdecl;
                                        function minPlayers: NSUInteger; cdecl;
                                        procedure setMaxPlayers
                                        (maxPlayers: NSUInteger); cdecl;
                                        function maxPlayers: NSUInteger; cdecl;
                                        procedure setPlayerGroup
                                        (playerGroup: NSUInteger); cdecl;
                                        function playerGroup: NSUInteger; cdecl;
                                        procedure setPlayerAttributes
                                        (playerAttributes: LongWord); cdecl;
                                        function playerAttributes
                                        : LongWord; cdecl;
                                        procedure setRecipients
                                        (recipients: NSArray); cdecl;
                                        function recipients: NSArray; cdecl;
                                        procedure setPlayersToInvite
                                        (playersToInvite: NSArray); cdecl;
                                        function playersToInvite
                                        : NSArray; cdecl;
                                        procedure setInviteMessage
                                        (inviteMessage: NSString); cdecl;
                                        function inviteMessage: NSString; cdecl;
                                        procedure setDefaultNumberOfPlayers
                                        (defaultNumberOfPlayers
                                        : NSUInteger); cdecl;
                                        function defaultNumberOfPlayers
                                        : NSUInteger; cdecl;
                                        procedure setRecipientResponseHandler
                                        (recipientResponseHandler
                                        : TGameKitRecipientResponseHandler);
                                        cdecl;
                                        function recipientResponseHandler
                                        : TGameKitRecipientResponseHandler;
                                        cdecl;
                                        procedure setInviteeResponseHandler
                                        (inviteeResponseHandler
                                        : TGameKitInviteeResponseHandler);
                                        cdecl;
                                        function inviteeResponseHandler
                                        : TGameKitInviteeResponseHandler; cdecl;
                                        end;

                                        TGKMatchRequest = class
                                        (TOCGenericImport<GKMatchRequestClass,
                                        GKMatchRequest>)
                                        end;
                                        PGKMatchRequest = Pointer;

                                        GKTurnBasedMatchClass = interface
                                        (NSObjectClass)
                                        ['{B76249FF-80BC-49E1-9190-7679A4996ED5}']
                                        { class } procedure findMatchForRequest
                                        (request: GKMatchRequest;
                                        withCompletionHandler
                                        : TGameKitWithCompletionHandler);
                                        cdecl;
                                        { class } procedure
                                        loadMatchesWithCompletionHandler
                                        (completionHandler
                                        : TGameKitCompletionHandler); cdecl;
                                        { class } procedure loadMatchWithID
                                        (matchID: NSString;
                                        withCompletionHandler
                                        : TGameKitWithCompletionHandler); cdecl;
                                        end;
                                        GKTurnBasedMatch = interface(NSObject)
                                        ['{1DE76674-7F55-477E-B0BD-AE0A7BC06656}']
                                        function matchID: NSString;
                                        cdecl;
                                        function creationDate: NSDate; cdecl;
                                        function participants: NSArray; cdecl;
                                        function status
                                        : GKTurnBasedMatchStatus; cdecl;
                                        function currentParticipant
                                        : GKTurnBasedParticipant; cdecl;
                                        function matchData: NSData; cdecl;
                                        procedure setLocalizableMessageWithKey
                                        (key: NSString;
                                        arguments: NSArray); cdecl;
                                        procedure setMessage
                                        (message: NSString); cdecl;
                                        function message: NSString; cdecl;
                                        function matchDataMaximumSize
                                        : NSUInteger; cdecl;
                                        function exchanges: NSArray; cdecl;
                                        function activeExchanges
                                        : NSArray; cdecl;
                                        function completedExchanges
                                        : NSArray; cdecl;
                                        function exchangeDataMaximumSize
                                        : NSUInteger; cdecl;
                                        function exchangeMaxInitiatedExchangesPerPlayer
                                        : NSUInteger; cdecl;
                                        procedure rematchWithCompletionHandler
                                        (completionHandler
                                        : TGameKitWithCompletionHandler); cdecl;
                                        procedure acceptInviteWithCompletionHandler
                                        (completionHandler
                                        : TGameKitWithCompletionHandler); cdecl;
                                        procedure declineInviteWithCompletionHandler
                                        (completionHandler
                                        : TGameKitCompletionHandler1); cdecl;
                                        procedure removeWithCompletionHandler
                                        (completionHandler
                                        : TGameKitCompletionHandler1); cdecl;
                                        procedure loadMatchDataWithCompletionHandler
                                        (completionHandler
                                        : TGameKitCompletionHandler4); cdecl;
                                        procedure endTurnWithNextParticipants
                                        (nextParticipants: NSArray;
                                        turnTimeout: NSTimeInterval;
                                        matchData: NSData;
                                        completionHandler
                                        : TGameKitCompletionHandler1); cdecl;
                                        [MethodName
                                        ('participantQuitInTurnWithOutcome:nextParticipants:turnTimeout:matchData:completionHandler:')
                                        ]
                                        procedure participantQuitInTurnWithOutcomeNextParticipantsTurnTimeoutMatchDataCompletionHandler
                                        (matchOutcome: GKTurnBasedMatchOutcome;
                                        nextParticipants: NSArray;
                                        turnTimeout: NSTimeInterval;
                                        matchData: NSData;
                                        completionHandler
                                        : TGameKitCompletionHandler1); cdecl;
                                        procedure participantQuitOutOfTurnWithOutcome
                                        (matchOutcome: GKTurnBasedMatchOutcome;
                                        withCompletionHandler
                                        : TGameKitCompletionHandler1); cdecl;
                                        [MethodName
                                        ('endMatchInTurnWithMatchData:completionHandler:')
                                        ]
                                        procedure endMatchInTurnWithMatchDataCompletionHandler
                                        (matchData: NSData;
                                        completionHandler
                                        : TGameKitCompletionHandler1); cdecl;
                                        [MethodName
                                        ('endMatchInTurnWithMatchData:scores:achievements:completionHandler:')
                                        ]
                                        procedure endMatchInTurnWithMatchDataScoresAchievementsCompletionHandler
                                        (matchData: NSData; scores: NSArray;
                                        achievements: NSArray;
                                        completionHandler
                                        : TGameKitCompletionHandler1); cdecl;
                                        procedure saveCurrentTurnWithMatchData
                                        (matchData: NSData;
                                        completionHandler
                                        : TGameKitCompletionHandler1); cdecl;
                                        procedure saveMergedMatchData
                                        (matchData: NSData;
                                        withResolvedExchanges: NSArray;
                                        completionHandler
                                        : TGameKitCompletionHandler1); cdecl;
                                        procedure sendExchangeToParticipants
                                        (participants: NSArray; data: NSData;
                                        localizableMessageKey: NSString;
                                        arguments: NSArray;
                                        timeout: NSTimeInterval;
                                        completionHandler
                                        : TGameKitCompletionHandler5); cdecl;
                                        procedure sendReminderToParticipants
                                        (participants: NSArray;
                                        localizableMessageKey: NSString;
                                        arguments: NSArray;
                                        completionHandler
                                        : TGameKitCompletionHandler1); cdecl;
                                        procedure endTurnWithNextParticipant
                                        (nextParticipant
                                        : GKTurnBasedParticipant;
                                        matchData: NSData;
                                        completionHandler
                                        : TGameKitCompletionHandler1); cdecl;
                                        [MethodName
                                        ('participantQuitInTurnWithOutcome:nextParticipant:matchData:completionHandler:')
                                        ]
                                        procedure participantQuitInTurnWithOutcomeNextParticipantMatchDataCompletionHandler
                                        (matchOutcome: GKTurnBasedMatchOutcome;
                                        nextParticipant: GKTurnBasedParticipant;
                                        matchData: NSData;
                                        completionHandler
                                        : TGameKitCompletionHandler1); cdecl;
                                        end;

                                        TGKTurnBasedMatch = class
                                        (TOCGenericImport<GKTurnBasedMatchClass,
                                        GKTurnBasedMatch>)
                                        end;
                                        PGKTurnBasedMatch = Pointer;

                                        GKTurnBasedExchangeClass = interface
                                        (NSObjectClass)
                                        ['{B1ECC796-387C-4601-AB33-6722FC007196}']
                                        end;
                                        GKTurnBasedExchange = interface
                                        (NSObject)
                                        ['{266CF3BA-FB0C-4FD8-B1E9-0191477D5604}']
                                        function exchangeID: NSString;
                                        cdecl;
                                        function sender
                                        : GKTurnBasedParticipant; cdecl;
                                        function recipients: NSArray; cdecl;
                                        function status
                                        : GKTurnBasedExchangeStatus; cdecl;
                                        function message: NSString; cdecl;
                                        function data: NSData; cdecl;
                                        function sendDate: NSDate; cdecl;
                                        function timeoutDate: NSDate; cdecl;
                                        function completionDate: NSDate; cdecl;
                                        function replies: NSArray; cdecl;
                                        procedure cancelWithLocalizableMessageKey
                                        (key: NSString; arguments: NSArray;
                                        completionHandler
                                        : TGameKitCompletionHandler1); cdecl;
                                        procedure replyWithLocalizableMessageKey
                                        (key: NSString; arguments: NSArray;
                                        data: NSData;
                                        completionHandler
                                        : TGameKitCompletionHandler1); cdecl;
                                        end;

                                        TGKTurnBasedExchange = class
                                        (TOCGenericImport<
                                        GKTurnBasedExchangeClass,
                                        GKTurnBasedExchange>)
                                        end;
                                        PGKTurnBasedExchange = Pointer;

                                        GKTurnBasedExchangeReplyClass =
                                        interface(NSObjectClass)
                                        ['{09E86A88-3412-496C-A3E8-62D9DEB31C42}']
                                        end;
                                        GKTurnBasedExchangeReply = interface
                                        (NSObject)
                                        ['{0EEF057A-34C8-4FE1-8D6B-5576A7E0C1AA}']
                                        function recipient
                                        : GKTurnBasedParticipant;
                                        cdecl;
                                        function message: NSString; cdecl;
                                        function data: NSData; cdecl;
                                        function replyDate: NSDate; cdecl;
                                        end;

                                        TGKTurnBasedExchangeReply = class
                                        (TOCGenericImport<
                                        GKTurnBasedExchangeReplyClass,
                                        GKTurnBasedExchangeReply>)
                                        end;
                                        PGKTurnBasedExchangeReply = Pointer;

                                        GKTurnBasedParticipantClass = interface
                                        (NSObjectClass)
                                        ['{9F77AF56-F73D-4A28-A6E1-236D673719D1}']
                                        end;
                                        GKTurnBasedParticipant = interface
                                        (NSObject)
                                        ['{3BBD76B4-513C-481F-8A1B-22C4235E8E67}']
                                        function player: GKPlayer;
                                        cdecl;
                                        function lastTurnDate: NSDate; cdecl;
                                        function status
                                        : GKTurnBasedParticipantStatus; cdecl;
                                        procedure setMatchOutcome
                                        (matchOutcome
                                        : GKTurnBasedMatchOutcome); cdecl;
                                        function matchOutcome
                                        : GKTurnBasedMatchOutcome; cdecl;
                                        function timeoutDate: NSDate; cdecl;
                                        function playerID: NSString; cdecl;
                                        end;

                                        TGKTurnBasedParticipant = class
                                        (TOCGenericImport<
                                        GKTurnBasedParticipantClass,
                                        GKTurnBasedParticipant>)
                                        end;
                                        PGKTurnBasedParticipant = Pointer;

                                        GKTurnBasedEventHandlerClass = interface
                                        (NSObjectClass)
                                        ['{6973C193-998A-414D-8494-F7D854EA3438}']
                                        { class } function
                                        sharedTurnBasedEventHandler
                                        : GKTurnBasedEventHandler;
                                        cdecl;
                                        end;
                                        GKTurnBasedEventHandler = interface
                                        (NSObject)
                                        ['{21BF448E-1EF4-4300-B191-BC0E8833351D}']
                                        procedure setDelegate
                                        (delegate: NSObject);
                                        cdecl;
                                        function delegate: NSObject; cdecl;
                                        end;

                                        TGKTurnBasedEventHandler = class
                                        (TOCGenericImport<
                                        GKTurnBasedEventHandlerClass,
                                        GKTurnBasedEventHandler>)
                                        end;
                                        PGKTurnBasedEventHandler = Pointer;

                                        GKMatchClass = interface(NSObjectClass)
                                        ['{A58D3A7C-7565-4F47-9660-F458C4C01220}']
                                        end;
                                        GKMatch = interface(NSObject)
                                        ['{7EAB394B-E8EC-4D96-991C-37ADA4ECBBA2}']
                                        function players: NSArray;
                                        cdecl;
                                        procedure setDelegate
                                        (delegate: Pointer); cdecl;
                                        function delegate: Pointer; cdecl;
                                        function expectedPlayerCount
                                        : NSUInteger; cdecl;
                                        [MethodName
                                        ('sendData:toPlayers:dataMode:error:')]
                                        function sendDataToPlayersDataModeError
                                        (data: NSData; toPlayers: NSArray;
                                        dataMode: GKMatchSendDataMode;
                                        error: NSError): Boolean; cdecl;
                                        function sendDataToAllPlayers
                                        (data: NSData;
                                        withDataMode: GKMatchSendDataMode;
                                        error: NSError): Boolean; cdecl;
                                        procedure disconnect; cdecl;
                                        function voiceChatWithName
                                        (name: NSString): GKVoiceChat; cdecl;
                                        procedure chooseBestHostingPlayerWithCompletionHandler
                                        (completionHandler
                                        : TGameKitCompletionHandler9); cdecl;
                                        procedure rematchWithCompletionHandler
                                        (completionHandler
                                        : TGameKitCompletionHandler6); cdecl;
                                        procedure chooseBestHostPlayerWithCompletionHandler
                                        (completionHandler
                                        : TGameKitCompletionHandler10); cdecl;
                                        [MethodName
                                        ('sendData:toPlayers:withDataMode:error:')
                                        ]
                                        function sendDataToPlayersWithDataModeError
                                        (data: NSData; toPlayers: NSArray;
                                        withDataMode: GKMatchSendDataMode;
                                        error: NSError): Boolean; cdecl;
                                        function playerIDs: NSArray; cdecl;
                                        end;

                                        TGKMatch = class
                                        (TOCGenericImport<
                                        GKMatchClass, GKMatch>)
                                        end;
                                        PGKMatch = Pointer;

                                        GKInviteClass = interface(NSObjectClass)
                                        ['{F73F3A36-5EBD-4E9F-B546-A091CC5B33C9}']
                                        end;
                                        GKInvite = interface(NSObject)
                                        ['{48330E9F-D121-4B3C-8A54-471EA68F7979}']
                                        function sender: GKPlayer;
                                        cdecl;
                                        function inviter: NSString; cdecl;
                                        function isHosted: Boolean; cdecl;
                                        function playerGroup: NSUInteger; cdecl;
                                        function playerAttributes
                                        : LongWord; cdecl;
                                        end;

                                        TGKInvite = class
                                        (TOCGenericImport<GKInviteClass,
                                        GKInvite>)
                                        end;
                                        PGKInvite = Pointer;

                                        GKMatchmakerClass = interface
                                        (NSObjectClass)
                                        ['{5B2D2B5B-61A0-4087-ADDD-8A9BEB585319}']
                                        { class } function sharedMatchmaker
                                        : GKMatchmaker;
                                        cdecl;
                                        end;
                                        GKMatchmaker = interface(NSObject)
                                        ['{E0425C9B-3D68-4612-AE57-CB8F97C2E305}']
                                        procedure matchForInvite
                                        (invite: GKInvite;
                                        completionHandler
                                        : TGameKitCompletionHandler6);
                                        cdecl;
                                        procedure findMatchForRequest
                                        (request: GKMatchRequest;
                                        withCompletionHandler
                                        : TGameKitCompletionHandler6); cdecl;
                                        procedure findPlayersForHostedRequest
                                        (request: GKMatchRequest;
                                        withCompletionHandler
                                        : TGameKitCompletionHandler); cdecl;
                                        procedure addPlayersToMatch
                                        (match: GKMatch;
                                        matchRequest: GKMatchRequest;
                                        completionHandler
                                        : TGameKitCompletionHandler1); cdecl;
                                        procedure cancel; cdecl;
                                        procedure cancelPendingInviteToPlayer
                                        (player: GKPlayer); cdecl;
                                        procedure finishMatchmakingForMatch
                                        (match: GKMatch); cdecl;
                                        procedure queryPlayerGroupActivity
                                        (playerGroup: NSUInteger;
                                        withCompletionHandler
                                        : TGameKitWithCompletionHandler1);
                                        cdecl;
                                        procedure queryActivityWithCompletionHandler
                                        (completionHandler
                                        : TGameKitWithCompletionHandler1);
                                        cdecl;
                                        procedure startBrowsingForNearbyPlayersWithHandler
                                        (reachableHandler
                                        : TGameKitReachableHandler); cdecl;
                                        procedure stopBrowsingForNearbyPlayers;
                                        cdecl;
                                        procedure setInviteHandler
                                        (inviteHandler
                                        : TGameKitInviteHandler); cdecl;
                                        function inviteHandler
                                        : TGameKitInviteHandler; cdecl;
                                        procedure startBrowsingForNearbyPlayersWithReachableHandler
                                        (reachableHandler
                                        : TGameKitReachableHandler1); cdecl;
                                        procedure cancelInviteToPlayer
                                        (playerID: NSString); cdecl;
                                        procedure findPlayersForHostedMatchRequest
                                        (request: GKMatchRequest;
                                        withCompletionHandler
                                        : TGameKitCompletionHandler); cdecl;
                                        end;

                                        TGKMatchmaker = class
                                        (TOCGenericImport<GKMatchmakerClass,
                                        GKMatchmaker>)
                                        end;
                                        PGKMatchmaker = Pointer;

                                        GKSavedGameClass = interface
                                        (NSObjectClass)
                                        ['{FD7AF5B1-7438-41D3-B6D7-0166289122C6}']
                                        end;
                                        GKSavedGame = interface(NSObject)
                                        ['{D9635233-6F6D-40C8-97F3-7A1498B51F26}']
                                        function name: NSString;
                                        cdecl;
                                        function deviceName: NSString; cdecl;
                                        function modificationDate
                                        : NSDate; cdecl;
                                        procedure loadDataWithCompletionHandler
                                        (handler: TGameKitCompletionHandler4);
                                        cdecl;
                                        end;

                                        TGKSavedGame = class
                                        (TOCGenericImport<GKSavedGameClass,
                                        GKSavedGame>)
                                        end;
                                        PGKSavedGame = Pointer;

                                        GKVoiceChatClass = interface
                                        (NSObjectClass)
                                        ['{7A6E8D8E-1994-43A2-94FE-7829F1F4D83A}']
                                        { class } function isVoIPAllowed
                                        : Boolean;
                                        cdecl;
                                        end;
                                        GKVoiceChat = interface(NSObject)
                                        ['{DEAB658C-6035-4331-A82F-B50C7260CE9E}']
                                        procedure start;
                                        cdecl;
                                        procedure stop; cdecl;
                                        procedure setPlayer(player: GKPlayer;
                                        muted: Boolean); cdecl;
                                        procedure setPlayerVoiceChatStateDidChangeHandler
                                        (playerVoiceChatStateDidChangeHandler
                                        : TGameKitPlayerVoiceChatStateDidChangeHandler);
                                        cdecl;
                                        function playerVoiceChatStateDidChangeHandler
                                        : TGameKitPlayerVoiceChatStateDidChangeHandler;
                                        cdecl;
                                        function name: NSString; cdecl;
                                        procedure setActive
                                        (active: Boolean); cdecl;
                                        function isActive: Boolean; cdecl;
                                        procedure setVolume
                                        (volume: Single); cdecl;
                                        function volume: Single; cdecl;
                                        function players: NSArray; cdecl;
                                        function playerIDs: NSArray; cdecl;
                                        procedure setPlayerStateUpdateHandler
                                        (playerStateUpdateHandler
                                        : TGameKitPlayerStateUpdateHandler);
                                        cdecl;
                                        function playerStateUpdateHandler
                                        : TGameKitPlayerStateUpdateHandler;
                                        cdecl;
                                        procedure setMute(isMuted: Boolean;
                                        forPlayer: NSString); cdecl;
                                        end;

                                        TGKVoiceChat = class
                                        (TOCGenericImport<GKVoiceChatClass,
                                        GKVoiceChat>)
                                        end;
                                        PGKVoiceChat = Pointer;

                                        GKMatchmakerViewControllerClass =
                                        interface(UINavigationControllerClass)
                                        ['{889DCD1B-85A2-4545-ACAD-ADA0C3A436E6}']
                                        end;
                                        GKMatchmakerViewController = interface
                                        (UINavigationController)
                                        ['{CB391E19-AF69-415C-9155-6C907DCEA452}']
                                        procedure setMatchmakerDelegate
                                        (matchmakerDelegate: Pointer);
                                        cdecl;
                                        function matchmakerDelegate
                                        : Pointer; cdecl;
                                        function matchRequest
                                        : GKMatchRequest; cdecl;
                                        procedure setHosted
                                        (hosted: Boolean); cdecl;
                                        function isHosted: Boolean; cdecl;
                                        function initWithMatchRequest
                                        (request: GKMatchRequest)
                                        : Pointer; cdecl;
                                        function initWithInvite
                                        (invite: GKInvite): Pointer; cdecl;
                                        procedure addPlayersToMatch
                                        (match: GKMatch); cdecl;
                                        [MethodName
                                        ('setHostedPlayer:connected:')]
                                        procedure setHostedPlayerConnected
                                        (playerID: NSString;
                                        connected: Boolean); cdecl;
                                        [MethodName
                                        ('setHostedPlayer:didConnect:')]
                                        procedure setHostedPlayerDidConnect
                                        (player: GKPlayer;
                                        didConnect: Boolean); cdecl;
                                        procedure setHostedPlayerReady
                                        (playerID: NSString); cdecl;
                                        procedure setDefaultInvitationMessage
                                        (defaultInvitationMessage
                                        : NSString); cdecl;
                                        function defaultInvitationMessage
                                        : NSString; cdecl;
                                        end;

                                        TGKMatchmakerViewController = class
                                        (TOCGenericImport<
                                        GKMatchmakerViewControllerClass,
                                        GKMatchmakerViewController>)
                                        end;
                                        PGKMatchmakerViewController = Pointer;

                                        GKNotificationBannerClass = interface
                                        (NSObjectClass)
                                        ['{16062D81-8FF0-4D72-B3FF-2BAF1534DDC1}']
                                        [MethodName
                                        ('showBannerWithTitle:message:completionHandler:')
                                        ]
                                        { class } procedure
                                        showBannerWithTitleMessageCompletionHandler
                                        (title: NSString; message: NSString;
                                        completionHandler
                                        : TGameKitCompletionHandler11);
                                        cdecl;
                                        [MethodName
                                        ('showBannerWithTitle:message:duration:completionHandler:')
                                        ]
                                        { class } procedure
                                        showBannerWithTitleMessageDurationCompletionHandler
                                        (title: NSString; message: NSString;
                                        duration: NSTimeInterval;
                                        completionHandler
                                        : TGameKitCompletionHandler11); cdecl;
                                        end;
                                        GKNotificationBanner = interface
                                        (NSObject)
                                        ['{4302F52B-5962-4F1D-A329-58E47B00DB8E}']
                                        end;

                                        TGKNotificationBanner = class
                                        (TOCGenericImport<
                                        GKNotificationBannerClass,
                                        GKNotificationBanner>)
                                        end;
                                        PGKNotificationBanner = Pointer;

                                        GKSessionClass = interface
                                        (NSObjectClass)
                                        ['{364F5C8E-9E90-4677-91E7-1BD964E02540}']
                                        end;
                                        GKSession = interface(NSObject)
                                        ['{4F3F64BC-D57D-478C-BB51-5565A4E2D2AB}']
                                        function initWithSessionID
                                        (sessionID: NSString;
                                        displayName: NSString;
                                        sessionMode: GKSessionMode): Pointer;
                                        cdecl;
                                        procedure setDelegate
                                        (delegate: Pointer); cdecl;
                                        function delegate: Pointer; cdecl;
                                        function sessionID: NSString; cdecl;
                                        function displayName: NSString; cdecl;
                                        function sessionMode
                                        : GKSessionMode; cdecl;
                                        function peerID: NSString; cdecl;
                                        procedure setAvailable
                                        (available: Boolean); cdecl;
                                        function isAvailable: Boolean; cdecl;
                                        procedure setDisconnectTimeout
                                        (disconnectTimeout
                                        : NSTimeInterval); cdecl;
                                        function disconnectTimeout
                                        : NSTimeInterval; cdecl;
                                        function displayNameForPeer
                                        (peerID: NSString): NSString; cdecl;
                                        function sendData(data: NSData;
                                        toPeers: NSArray;
                                        withDataMode: GKSendDataMode;
                                        error: NSError): Boolean; cdecl;
                                        function sendDataToAllPeers
                                        (data: NSData;
                                        withDataMode: GKSendDataMode;
                                        error: NSError): Boolean; cdecl;
                                        procedure setDataReceiveHandler
                                        (handler: Pointer;
                                        withContext: Pointer); cdecl;
                                        procedure connectToPeer
                                        (peerID: NSString;
                                        withTimeout: NSTimeInterval); cdecl;
                                        procedure cancelConnectToPeer
                                        (peerID: NSString); cdecl;
                                        function acceptConnectionFromPeer
                                        (peerID: NSString; error: NSError)
                                        : Boolean; cdecl;
                                        procedure denyConnectionFromPeer
                                        (peerID: NSString); cdecl;
                                        procedure disconnectPeerFromAllPeers
                                        (peerID: NSString); cdecl;
                                        procedure disconnectFromAllPeers; cdecl;
                                        function peersWithConnectionState
                                        (state: GKPeerConnectionState)
                                        : NSArray; cdecl;
                                        end;

                                        TGKSession = class
                                        (TOCGenericImport<GKSessionClass,
                                        GKSession>)
                                        end;
                                        PGKSession = Pointer;

                                        GKVoiceChatServiceClass = interface
                                        (NSObjectClass)
                                        ['{08049580-1C8C-460F-9BD5-AD141DC93552}']
                                        { class } function
                                        defaultVoiceChatService
                                        : GKVoiceChatService;
                                        cdecl;
                                        { class } function isVoIPAllowed
                                        : Boolean; cdecl;
                                        end;
                                        GKVoiceChatService = interface(NSObject)
                                        ['{91A326D8-2005-456C-8AC9-037A57E74785}']
                                        procedure setClient(client: Pointer);
                                        cdecl;
                                        function client: Pointer; cdecl;
                                        function startVoiceChatWithParticipantID
                                        (participantID: NSString;
                                        error: NSError): Boolean; cdecl;
                                        procedure stopVoiceChatWithParticipantID
                                        (participantID: NSString); cdecl;
                                        function acceptCallID(callID: NSInteger;
                                        error: NSError): Boolean; cdecl;
                                        procedure denyCallID
                                        (callID: NSInteger); cdecl;
                                        procedure receivedRealTimeData
                                        (audio: NSData;
                                        fromParticipantID: NSString); cdecl;
                                        procedure receivedData
                                        (arbitraryData: NSData;
                                        fromParticipantID: NSString); cdecl;
                                        procedure setMicrophoneMuted
                                        (microphoneMuted: Boolean); cdecl;
                                        function isMicrophoneMuted
                                        : Boolean; cdecl;
                                        procedure setRemoteParticipantVolume
                                        (remoteParticipantVolume
                                        : Single); cdecl;
                                        function remoteParticipantVolume
                                        : Single; cdecl;
                                        procedure setOutputMeteringEnabled
                                        (outputMeteringEnabled: Boolean); cdecl;
                                        function isOutputMeteringEnabled
                                        : Boolean; cdecl;
                                        procedure setInputMeteringEnabled
                                        (inputMeteringEnabled: Boolean); cdecl;
                                        function isInputMeteringEnabled
                                        : Boolean; cdecl;
                                        function outputMeterLevel
                                        : Single; cdecl;
                                        function inputMeterLevel: Single; cdecl;
                                        end;

                                        TGKVoiceChatService = class
                                        (TOCGenericImport<
                                        GKVoiceChatServiceClass,
                                        GKVoiceChatService>)
                                        end;
                                        PGKVoiceChatService = Pointer;

                                        GKPeerPickerControllerClass = interface
                                        (NSObjectClass)
                                        ['{267C5E92-9BEB-47F9-998C-9DAEC0E0D976}']
                                        end;
                                        GKPeerPickerController = interface
                                        (NSObject)
                                        ['{4F223DB9-E4F4-4F2F-8D7A-CDB02843DF67}']
                                        procedure setConnectionTypesMask
                                        (connectionTypesMask
                                        : GKPeerPickerConnectionType);
                                        cdecl;
                                        function connectionTypesMask
                                        : GKPeerPickerConnectionType; cdecl;
                                        procedure setDelegate
                                        (delegate: Pointer); cdecl;
                                        function delegate: Pointer; cdecl;
                                        procedure show; cdecl;
                                        procedure dismiss; cdecl;
                                        function isVisible: Boolean; cdecl;
                                        end;

                                        TGKPeerPickerController = class
                                        (TOCGenericImport<
                                        GKPeerPickerControllerClass,
                                        GKPeerPickerController>)
                                        end;
                                        PGKPeerPickerController = Pointer;

                                        GKTurnBasedMatchmakerViewControllerClass =
                                        interface(UINavigationControllerClass)
                                        ['{230DB46A-4E92-408B-B8E1-15ED195A6880}']
                                        end;
                                        GKTurnBasedMatchmakerViewController =
                                        interface(UINavigationController)
                                        ['{9D511FFC-AA3C-4C37-A1AA-36CE813983FF}']
                                        procedure setTurnBasedMatchmakerDelegate
                                        (turnBasedMatchmakerDelegate: Pointer);
                                        cdecl;
                                        function turnBasedMatchmakerDelegate
                                        : Pointer; cdecl;
                                        procedure setShowExistingMatches
                                        (showExistingMatches: Boolean); cdecl;
                                        function showExistingMatches
                                        : Boolean; cdecl;
                                        function initWithMatchRequest
                                        (request: GKMatchRequest)
                                        : Pointer; cdecl;
                                        end;

                                        TGKTurnBasedMatchmakerViewController =
                                        class(TOCGenericImport<
                                        GKTurnBasedMatchmakerViewControllerClass,
                                        GKTurnBasedMatchmakerViewController>)
                                        end;
                                        PGKTurnBasedMatchmakerViewController =
                                        Pointer;

                                        // ===== Protocol declarations =====

                                        GKGameCenterControllerDelegate =
                                        interface(IObjectiveC)
                                        ['{1A4B255A-CFEA-40F3-B647-DA119979F16A}']
                                        procedure gameCenterViewControllerDidFinish
                                        (gameCenterViewController
                                        : GKGameCenterViewController);
                                        cdecl;
                                        end;

                                        GKAchievementViewControllerDelegate =
                                        interface(IObjectiveC)
                                        ['{887BC852-4A95-489E-9F18-C366095C58DB}']
                                        procedure achievementViewControllerDidFinish
                                        (viewController
                                        : GKAchievementViewController);
                                        cdecl;
                                        end;

                                        GKChallengeEventHandlerDelegate =
                                        interface(IObjectiveC)
                                        ['{91B2CFC4-D7A2-4949-AE7D-A014356F07FC}']
                                        procedure localPlayerDidSelectChallenge
                                        (challenge: GKChallenge);
                                        cdecl;
                                        function shouldShowBannerForLocallyReceivedChallenge
                                        (challenge: GKChallenge)
                                        : Boolean; cdecl;
                                        procedure localPlayerDidReceiveChallenge
                                        (challenge: GKChallenge); cdecl;
                                        function shouldShowBannerForLocallyCompletedChallenge
                                        (challenge: GKChallenge)
                                        : Boolean; cdecl;
                                        procedure localPlayerDidCompleteChallenge
                                        (challenge: GKChallenge); cdecl;
                                        function shouldShowBannerForRemotelyCompletedChallenge
                                        (challenge: GKChallenge)
                                        : Boolean; cdecl;
                                        procedure remotePlayerDidCompleteChallenge
                                        (challenge: GKChallenge); cdecl;
                                        end;

                                        GKChallengeListener = interface
                                        (IObjectiveC)
                                        ['{4BC8DBB8-EFCB-455E-AE34-5E7BB5D86A04}']
                                        [MethodName
                                        ('player:wantsToPlayChallenge:')]
                                        procedure playerWantsToPlayChallenge
                                        (player: GKPlayer;
                                        wantsToPlayChallenge: GKChallenge);
                                        cdecl;
                                        [MethodName
                                        ('player:didReceiveChallenge:')]
                                        procedure playerDidReceiveChallenge
                                        (player: GKPlayer;
                                        didReceiveChallenge
                                        : GKChallenge); cdecl;
                                        [MethodName
                                        ('player:didCompleteChallenge:issuedByFriend:')
                                        ]
                                        procedure playerDidCompleteChallengeIssuedByFriend
                                        (player: GKPlayer;
                                        didCompleteChallenge: GKChallenge;
                                        issuedByFriend: GKPlayer); cdecl;
                                        [MethodName
                                        ('player:issuedChallengeWasCompleted:byFriend:')
                                        ]
                                        procedure playerIssuedChallengeWasCompletedByFriend
                                        (player: GKPlayer;
                                        issuedChallengeWasCompleted
                                        : GKChallenge;
                                        byFriend: GKPlayer); cdecl;
                                        end;

                                        GKFriendRequestComposeViewControllerDelegate =
                                        interface(IObjectiveC)
                                        ['{5B0008E1-AE5D-4580-A828-C6DCFE6625AA}']
                                        procedure friendRequestComposeViewControllerDidFinish
                                        (viewController
                                        : GKFriendRequestComposeViewController);
                                        cdecl;
                                        end;

                                        GKLeaderboardViewControllerDelegate =
                                        interface(IObjectiveC)
                                        ['{653DAD3B-7BCC-4602-AB2D-4F8EB03BD5C0}']
                                        procedure leaderboardViewControllerDidFinish
                                        (viewController
                                        : GKLeaderboardViewController);
                                        cdecl;
                                        end;

                                        GKTurnBasedEventListener = interface
                                        (IObjectiveC)
                                        ['{3DCAA100-B308-4EDB-B21C-8CE6C4807C09}']
                                        [MethodName
                                        ('player:didRequestMatchWithOtherPlayers:')
                                        ]
                                        procedure playerDidRequestMatchWithOtherPlayers
                                        (player: GKPlayer;
                                        didRequestMatchWithOtherPlayers
                                        : NSArray);
                                        cdecl;
                                        [MethodName
                                        ('player:receivedTurnEventForMatch:didBecomeActive:')
                                        ]
                                        procedure playerReceivedTurnEventForMatchDidBecomeActive
                                        (player: GKPlayer;
                                        receivedTurnEventForMatch
                                        : GKTurnBasedMatch;
                                        didBecomeActive: Boolean); cdecl;
                                        [MethodName('player:matchEnded:')]
                                        procedure playerMatchEnded
                                        (player: GKPlayer;
                                        matchEnded: GKTurnBasedMatch); cdecl;
                                        [MethodName
                                        ('player:receivedExchangeRequest:forMatch:')
                                        ]
                                        procedure playerReceivedExchangeRequestForMatch
                                        (player: GKPlayer;
                                        receivedExchangeRequest
                                        : GKTurnBasedExchange;
                                        forMatch: GKTurnBasedMatch); cdecl;
                                        [MethodName
                                        ('player:receivedExchangeCancellation:forMatch:')
                                        ]
                                        procedure playerReceivedExchangeCancellationForMatch
                                        (player: GKPlayer;
                                        receivedExchangeCancellation
                                        : GKTurnBasedExchange;
                                        forMatch: GKTurnBasedMatch); cdecl;
                                        [MethodName
                                        ('player:receivedExchangeReplies:forCompletedExchange:forMatch:')
                                        ]
                                        procedure playerReceivedExchangeRepliesForCompletedExchangeForMatch
                                        (player: GKPlayer;
                                        receivedExchangeReplies: NSArray;
                                        forCompletedExchange
                                        : GKTurnBasedExchange;
                                        forMatch: GKTurnBasedMatch); cdecl;
                                        [MethodName('player:wantsToQuitMatch:')]
                                        procedure playerWantsToQuitMatch
                                        (player: GKPlayer;
                                        wantsToQuitMatch
                                        : GKTurnBasedMatch); cdecl;
                                        [MethodName
                                        ('player:didRequestMatchWithPlayers:')]
                                        procedure playerDidRequestMatchWithPlayers
                                        (player: GKPlayer;
                                        didRequestMatchWithPlayers
                                        : NSArray); cdecl;
                                        end;

                                        GKTurnBasedEventHandlerDelegate =
                                        interface(IObjectiveC)
                                        ['{9EE540C6-CAD6-4FA4-8E18-73499BF2F5AE}']
                                        procedure handleInviteFromGameCenter
                                        (playersToInvite: NSArray);
                                        cdecl;
                                        [MethodName
                                        ('handleTurnEventForMatch:didBecomeActive:')
                                        ]
                                        procedure handleTurnEventForMatchDidBecomeActive
                                        (match: GKTurnBasedMatch;
                                        didBecomeActive: Boolean); cdecl;
                                        [MethodName('handleTurnEventForMatch:')]
                                        procedure handleTurnEventForMatch
                                        (match: GKTurnBasedMatch); cdecl;
                                        procedure handleMatchEnded
                                        (match: GKTurnBasedMatch); cdecl;
                                        end;

                                        GKInviteEventListener = interface
                                        (IObjectiveC)
                                        ['{9FC97FC8-3EAB-4EAC-817D-3BFD1290F3EC}']
                                        [MethodName('player:didAcceptInvite:')]
                                        procedure playerDidAcceptInvite
                                        (player: GKPlayer;
                                        didAcceptInvite: GKInvite);
                                        cdecl;
                                        [MethodName
                                        ('player:didRequestMatchWithRecipients:')
                                        ]
                                        procedure playerDidRequestMatchWithRecipients
                                        (player: GKPlayer;
                                        didRequestMatchWithRecipients
                                        : NSArray); cdecl;
                                        [MethodName
                                        ('player:didRequestMatchWithPlayers:')]
                                        procedure playerDidRequestMatchWithPlayers
                                        (player: GKPlayer;
                                        didRequestMatchWithPlayers
                                        : NSArray); cdecl;
                                        end;

                                        GKSavedGameListener = interface
                                        (IObjectiveC)
                                        ['{FE26E78D-6A67-4925-B86C-2C502EE7366A}']
                                        [MethodName
                                        ('player:didModifySavedGame:')]
                                        procedure playerDidModifySavedGame
                                        (player: GKPlayer;
                                        didModifySavedGame: GKSavedGame);
                                        cdecl;
                                        [MethodName
                                        ('player:hasConflictingSavedGames:')]
                                        procedure playerHasConflictingSavedGames
                                        (player: GKPlayer;
                                        hasConflictingSavedGames
                                        : NSArray); cdecl;
                                        end;

                                        GKLocalPlayerListener = interface
                                        (IObjectiveC)
                                        ['{6BAE1C4D-847D-482C-A6D3-06A68F049913}']
                                        end;

                                        GKMatchDelegate = interface(IObjectiveC)
                                        ['{6FC06D1E-A589-4989-B4D8-42DC01D1C85F}']
                                        [MethodName
                                        ('match:didReceiveData:fromRemotePlayer:')
                                        ]
                                        procedure matchDidReceiveDataFromRemotePlayer
                                        (match: GKMatch; didReceiveData: NSData;
                                        fromRemotePlayer: GKPlayer);
                                        cdecl;
                                        [MethodName
                                        ('match:didReceiveData:forRecipient:fromRemotePlayer:')
                                        ]
                                        procedure matchDidReceiveDataForRecipientFromRemotePlayer
                                        (match: GKMatch; didReceiveData: NSData;
                                        forRecipient: GKPlayer;
                                        fromRemotePlayer: GKPlayer); cdecl;
                                        [MethodName
                                        ('match:didReceiveData:fromPlayer:')]
                                        procedure matchDidReceiveDataFromPlayer
                                        (match: GKMatch; didReceiveData: NSData;
                                        fromPlayer: NSString); cdecl;
                                        [MethodName
                                        ('match:player:didChangeConnectionState:')
                                        ]
                                        procedure matchPlayerDidChangeConnectionState
                                        (match: GKMatch; player: GKPlayer;
                                        didChangeConnectionState
                                        : GKPlayerConnectionState); cdecl;
                                        [MethodName
                                        ('match:player:didChangeState:')]
                                        procedure matchPlayerDidChangeState
                                        (match: GKMatch; player: NSString;
                                        didChangeState
                                        : GKPlayerConnectionState); cdecl;
                                        [MethodName('match:didFailWithError:')]
                                        procedure matchDidFailWithError
                                        (match: GKMatch;
                                        didFailWithError: NSError); cdecl;
                                        [MethodName
                                        ('match:shouldReinviteDisconnectedPlayer:')
                                        ]
                                        function matchShouldReinviteDisconnectedPlayer
                                        (match: GKMatch;
                                        shouldReinviteDisconnectedPlayer
                                        : GKPlayer): Boolean; cdecl;
                                        [MethodName
                                        ('match:shouldReinvitePlayer:')]
                                        function matchShouldReinvitePlayer
                                        (match: GKMatch;
                                        shouldReinvitePlayer: NSString)
                                        : Boolean; cdecl;
                                        end;

                                        GKMatchmakerViewControllerDelegate =
                                        interface(IObjectiveC)
                                        ['{1B52E11A-9708-4699-AB7B-C51AE1977BB9}']
                                        procedure matchmakerViewControllerWasCancelled
                                        (viewController
                                        : GKMatchmakerViewController);
                                        cdecl;
                                        [MethodName
                                        ('matchmakerViewController:didFailWithError:')
                                        ]
                                        procedure matchmakerViewControllerDidFailWithError
                                        (viewController
                                        : GKMatchmakerViewController;
                                        didFailWithError: NSError); cdecl;
                                        [MethodName
                                        ('matchmakerViewController:didFindMatch:')
                                        ]
                                        procedure matchmakerViewControllerDidFindMatch
                                        (viewController
                                        : GKMatchmakerViewController;
                                        didFindMatch: GKMatch); cdecl;
                                        [MethodName
                                        ('matchmakerViewController:didFindHostedPlayers:')
                                        ]
                                        procedure matchmakerViewControllerDidFindHostedPlayers
                                        (viewController
                                        : GKMatchmakerViewController;
                                        didFindHostedPlayers: NSArray); cdecl;
                                        [MethodName
                                        ('matchmakerViewController:didFindPlayers:')
                                        ]
                                        procedure matchmakerViewControllerDidFindPlayers
                                        (viewController
                                        : GKMatchmakerViewController;
                                        didFindPlayers: NSArray); cdecl;
                                        [MethodName
                                        ('matchmakerViewController:hostedPlayerDidAccept:')
                                        ]
                                        procedure matchmakerViewControllerHostedPlayerDidAccept
                                        (viewController
                                        : GKMatchmakerViewController;
                                        hostedPlayerDidAccept: GKPlayer); cdecl;
                                        [MethodName
                                        ('matchmakerViewController:didReceiveAcceptFromHostedPlayer:')
                                        ]
                                        procedure matchmakerViewControllerDidReceiveAcceptFromHostedPlayer
                                        (viewController
                                        : GKMatchmakerViewController;
                                        didReceiveAcceptFromHostedPlayer
                                        : NSString); cdecl;
                                        end;

                                        GKSessionDelegate = interface
                                        (IObjectiveC)
                                        ['{5C16B8AD-DD31-4A9A-A4DD-B89AB6E49CB7}']
                                        [MethodName
                                        ('session:peer:didChangeState:')]
                                        procedure sessionPeerDidChangeState
                                        (session: GKSession; peer: NSString;
                                        didChangeState: GKPeerConnectionState);
                                        cdecl;
                                        [MethodName
                                        ('session:didReceiveConnectionRequestFromPeer:')
                                        ]
                                        procedure sessionDidReceiveConnectionRequestFromPeer
                                        (session: GKSession;
                                        didReceiveConnectionRequestFromPeer
                                        : NSString); cdecl;
                                        [MethodName
                                        ('session:connectionWithPeerFailed:withError:')
                                        ]
                                        procedure sessionConnectionWithPeerFailedWithError
                                        (session: GKSession;
                                        connectionWithPeerFailed: NSString;
                                        withError: NSError); cdecl;
                                        [MethodName
                                        ('session:didFailWithError:')]
                                        procedure sessionDidFailWithError
                                        (session: GKSession;
                                        didFailWithError: NSError); cdecl;
                                        end;

                                        GKVoiceChatClient = interface
                                        (IObjectiveC)
                                        ['{9C8D52E6-7CB6-4070-AFFB-E2D02E2EE32E}']
                                        [MethodName
                                        ('voiceChatService:sendData:toParticipantID:')
                                        ]
                                        procedure voiceChatServiceSendDataToParticipantID
                                        (voiceChatService: GKVoiceChatService;
                                        sendData: NSData;
                                        toParticipantID: NSString);
                                        cdecl;
                                        function participantID: NSString; cdecl;
                                        [MethodName
                                        ('voiceChatService:sendRealTimeData:toParticipantID:')
                                        ]
                                        procedure voiceChatServiceSendRealTimeDataToParticipantID
                                        (voiceChatService: GKVoiceChatService;
                                        sendRealTimeData: NSData;
                                        toParticipantID: NSString); cdecl;
                                        [MethodName
                                        ('voiceChatService:didStartWithParticipantID:')
                                        ]
                                        procedure voiceChatServiceDidStartWithParticipantID
                                        (voiceChatService: GKVoiceChatService;
                                        didStartWithParticipantID
                                        : NSString); cdecl;
                                        [MethodName
                                        ('voiceChatService:didNotStartWithParticipantID:error:')
                                        ]
                                        procedure voiceChatServiceDidNotStartWithParticipantIDError
                                        (voiceChatService: GKVoiceChatService;
                                        didNotStartWithParticipantID: NSString;
                                        error: NSError); cdecl;
                                        [MethodName
                                        ('voiceChatService:didStopWithParticipantID:error:')
                                        ]
                                        procedure voiceChatServiceDidStopWithParticipantIDError
                                        (voiceChatService: GKVoiceChatService;
                                        didStopWithParticipantID: NSString;
                                        error: NSError); cdecl;
                                        [MethodName
                                        ('voiceChatService:didReceiveInvitationFromParticipantID:callID:')
                                        ]
                                        procedure voiceChatServiceDidReceiveInvitationFromParticipantIDCallID
                                        (voiceChatService: GKVoiceChatService;
                                        didReceiveInvitationFromParticipantID
                                        : NSString; callID: NSInteger); cdecl;
                                        end;

                                        GKPeerPickerControllerDelegate =
                                        interface(IObjectiveC)
                                        ['{FEC6E4C3-F9D0-47C4-A6A8-F09E3DB8AA7C}']
                                        [MethodName
                                        ('peerPickerController:didSelectConnectionType:')
                                        ]
                                        procedure peerPickerControllerDidSelectConnectionType
                                        (picker: GKPeerPickerController;
                                        didSelectConnectionType
                                        : GKPeerPickerConnectionType);
                                        cdecl;
                                        [MethodName
                                        ('peerPickerController:sessionForConnectionType:')
                                        ]
                                        function peerPickerControllerSessionForConnectionType
                                        (picker: GKPeerPickerController;
                                        sessionForConnectionType
                                        : GKPeerPickerConnectionType)
                                        : GKSession; cdecl;
                                        [MethodName
                                        ('peerPickerController:didConnectPeer:toSession:')
                                        ]
                                        procedure peerPickerControllerDidConnectPeerToSession
                                        (picker: GKPeerPickerController;
                                        didConnectPeer: NSString;
                                        toSession: GKSession); cdecl;
                                        procedure peerPickerControllerDidCancel
                                        (picker: GKPeerPickerController); cdecl;
                                        end;

                                        GKTurnBasedMatchmakerViewControllerDelegate =
                                        interface(IObjectiveC)
                                        ['{F44EBEFF-81D3-4401-B53E-A3B3A5540359}']
                                        procedure turnBasedMatchmakerViewControllerWasCancelled
                                        (viewController
                                        : GKTurnBasedMatchmakerViewController);
                                        cdecl;
                                        [MethodName
                                        ('turnBasedMatchmakerViewController:didFailWithError:')
                                        ]
                                        procedure turnBasedMatchmakerViewControllerDidFailWithError
                                        (viewController
                                        : GKTurnBasedMatchmakerViewController;
                                        didFailWithError: NSError); cdecl;
                                        [MethodName
                                        ('turnBasedMatchmakerViewController:didFindMatch:')
                                        ]
                                        procedure turnBasedMatchmakerViewControllerDidFindMatch
                                        (viewController
                                        : GKTurnBasedMatchmakerViewController;
                                        didFindMatch: GKTurnBasedMatch); cdecl;
                                        [MethodName
                                        ('turnBasedMatchmakerViewController:playerQuitForMatch:')
                                        ]
                                        procedure turnBasedMatchmakerViewControllerPlayerQuitForMatch
                                        (viewController
                                        : GKTurnBasedMatchmakerViewController;
                                        playerQuitForMatch
                                        : GKTurnBasedMatch); cdecl;
                                        end;

                                        // ===== Exported string consts =====

                                        function GKErrorDomain: NSString;
                                        function GKPlayerDidChangeNotificationName
                                        : NSString;
                                        function GKTurnTimeoutDefault: Pointer;
                                        function GKTurnTimeoutNone: Pointer;
                                        function GKExchangeTimeoutDefault
                                        : Pointer;
                                        function GKExchangeTimeoutNone: Pointer;
                                        function GKPlayerAuthenticationDidChangeNotificationName
                                        : NSString;
                                        function GKSessionErrorDomain: NSString;
                                        function GKVoiceChatServiceErrorDomain
                                        : NSString;


                                        // ===== External functions =====

                                        const
                                        libGameKit =
                                        '/System/Library/Frameworks/GameKit.framework/GameKit';

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

function GKPlayerDidChangeNotificationName: NSString;
begin
  Result := CocoaNSStringConst(libGameKit, 'GKPlayerDidChangeNotificationName');
end;

function GKPlayerAuthenticationDidChangeNotificationName: NSString;
begin
  Result := CocoaNSStringConst(libGameKit,
    'GKPlayerAuthenticationDidChangeNotificationName');
end;

function GKSessionErrorDomain: NSString;
begin
  Result := CocoaNSStringConst(libGameKit, 'GKSessionErrorDomain');
end;

function GKVoiceChatServiceErrorDomain: NSString;
begin
  Result := CocoaNSStringConst(libGameKit, 'GKVoiceChatServiceErrorDomain');
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

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

GameKitModule := dlopen(MarshaledAString(libGameKit), RTLD_LAZY);

finalization

dlclose(GameKitModule);
{$ENDIF IOS}

end.
