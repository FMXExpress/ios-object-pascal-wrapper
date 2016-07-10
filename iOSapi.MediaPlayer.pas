{ *********************************************************** }
{ }
{ CodeGear Delphi Runtime Library }
{ }
{ Copyright(c) 2012-2014 Embarcadero Technologies, Inc. }
{ }
{ *********************************************************** }

//
// Delphi-Objective-C Bridge
// Interfaces for Cocoa framework MediaPlayer
//

unit iOSapi.MediaPlayer;

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
  iOSapi.CoreGraphics,
  iOSapi.Foundation,
  iOSapi.UIKit;

const
  MPErrorUnknown = 0;
  MPErrorPermissionDenied = 1;
  MPErrorCloudServiceCapabilityMissing = 2;
  MPErrorNetworkConnectionFailed = 3;
  MPErrorNotFound = 4;
  MPErrorNotSupported = 5;
  MPMediaTypeMusic = 1 shl 0;
  MPMediaTypePodcast = 1 shl 1;
  MPMediaTypeAudioBook = 1 shl 2;
  MPMediaTypeAudioITunesU = 1 shl 3;
  MPMediaTypeAnyAudio = 255;
  MPMediaTypeMovie = 1 shl 8;
  MPMediaTypeTVShow = 1 shl 9;
  MPMediaTypeVideoPodcast = 1 shl 10;
  MPMediaTypeMusicVideo = 1 shl 11;
  MPMediaTypeVideoITunesU = 1 shl 12;
  MPMediaTypeHomeVideo = 1 shl 13;
  MPMediaTypeAnyVideo = 65280;
  MPMediaTypeAny = not 0;
  MPMediaLibraryAuthorizationStatusNotDetermined = 0;
  MPMediaLibraryAuthorizationStatusDenied = 1;
  MPMediaLibraryAuthorizationStatusRestricted = 2;
  MPMediaLibraryAuthorizationStatusAuthorized = 3;
  MPMediaPlaylistAttributeNone = 0;
  MPMediaPlaylistAttributeOnTheGo = (1 shl 0);
  MPMediaPlaylistAttributeSmart = (1 shl 1);
  MPMediaPlaylistAttributeGenius = (1 shl 2);
  MPMediaGroupingTitle = 0;
  MPMediaGroupingAlbum = 1;
  MPMediaGroupingArtist = 2;
  MPMediaGroupingAlbumArtist = 3;
  MPMediaGroupingComposer = 4;
  MPMediaGroupingGenre = 5;
  MPMediaGroupingPlaylist = 6;
  MPMediaGroupingPodcastTitle = 7;
  MPMediaPredicateComparisonEqualTo = 0;
  MPMediaPredicateComparisonContains = 1;
  MPMovieScalingModeNone = 0;
  MPMovieScalingModeAspectFit = 1;
  MPMovieScalingModeAspectFill = 2;
  MPMovieScalingModeFill = 3;
  MPMoviePlaybackStateStopped = 0;
  MPMoviePlaybackStatePlaying = 1;
  MPMoviePlaybackStatePaused = 2;
  MPMoviePlaybackStateInterrupted = 3;
  MPMoviePlaybackStateSeekingForward = 4;
  MPMoviePlaybackStateSeekingBackward = 5;
  MPMovieLoadStateUnknown = 0;
  MPMovieLoadStatePlayable = 1 shl 0;
  MPMovieLoadStatePlaythroughOK = 1 shl 1;
  MPMovieLoadStateStalled = 1 shl 2;
  MPMovieRepeatModeNone = 0;
  MPMovieRepeatModeOne = 1;
  MPMovieControlStyleNone = 0;
  MPMovieControlStyleEmbedded = 1;
  MPMovieControlStyleFullscreen = 2;
  MPMovieControlStyleDefault = MPMovieControlStyleEmbedded;
  MPMovieFinishReasonPlaybackEnded = 0;
  MPMovieFinishReasonPlaybackError = 1;
  MPMovieFinishReasonUserExited = 2;
  MPMovieMediaTypeMaskNone = 0;
  MPMovieMediaTypeMaskVideo = 1 shl 0;
  MPMovieMediaTypeMaskAudio = 1 shl 1;
  MPMovieSourceTypeUnknown = 0;
  MPMovieSourceTypeFile = 1;
  MPMovieSourceTypeStreaming = 2;
  MPMovieTimeOptionNearestKeyFrame = 0;
  MPMovieTimeOptionExact = 1;
  MPMusicPlaybackStateStopped = 0;
  MPMusicPlaybackStatePlaying = 1;
  MPMusicPlaybackStatePaused = 2;
  MPMusicPlaybackStateInterrupted = 3;
  MPMusicPlaybackStateSeekingForward = 4;
  MPMusicPlaybackStateSeekingBackward = 5;
  MPMusicRepeatModeDefault = 0;
  MPMusicRepeatModeNone = 1;
  MPMusicRepeatModeOne = 2;
  MPMusicRepeatModeAll = 3;
  MPMusicShuffleModeDefault = 0;
  MPMusicShuffleModeOff = 1;
  MPMusicShuffleModeSongs = 2;
  MPMusicShuffleModeAlbums = 3;
  MPNowPlayingInfoLanguageOptionTypeAudible = 0;
  MPNowPlayingInfoLanguageOptionTypeLegible = 1;
  MPRemoteCommandHandlerStatusSuccess = 0;
  MPRemoteCommandHandlerStatusNoSuchContent = 100;
  MPRemoteCommandHandlerStatusNoActionableNowPlayingItem = 110;
  MPRemoteCommandHandlerStatusCommandFailed = 200;
  MPSeekCommandEventTypeBeginSeeking = 0;
  MPSeekCommandEventTypeEndSeeking = 1;

type

  // ===== Forward declarations =====
{$M+}
  MPNowPlayingInfoLanguageOption = interface;
  MPNowPlayingInfoLanguageOptionGroup = interface;
  MPNowPlayingInfoLanguageOptionAdditions = interface;
  MPMediaItemArtwork = interface;
  MPContentItem = interface;
  MPMediaLibrary = interface;
  MPMediaEntity = interface;
  MPMediaItem = interface;
  MPMediaItemCollection = interface;
  MPMediaQuery = interface;
  MPMediaPlaylist = interface;
  MPMediaPlaylistCreationMetadata = interface;
  MPMediaPickerControllerDelegate = interface;
  MPMediaPickerController = interface;
  MPMediaPredicate = interface;
  MPMediaQuerySection = interface;
  MPMediaPropertyPredicate = interface;
  MPMediaPlayback = interface;
  MPMovieAccessLog = interface;
  MPMovieErrorLog = interface;
  MPMoviePlayerController = interface;
  MPTimedMetadata = interface;
  MPMovieAccessLogEvent = interface;
  MPMovieErrorLogEvent = interface;
  MPMoviePlayerViewController = interface;
  MPMusicPlayerController = interface;
  MPNowPlayingInfoCenter = interface;
  MPPlayableContentDataSource = interface;
  MPPlayableContentManager = interface;
  MPPlayableContentManagerContext = interface;
  MPPlayableContentDelegate = interface;
  MPRemoteCommandEvent = interface;
  MPRemoteCommand = interface;
  MPSkipIntervalCommand = interface;
  MPFeedbackCommand = interface;
  MPRatingCommand = interface;
  MPChangePlaybackRateCommand = interface;
  MPChangePlaybackPositionCommand = interface;
  MPRemoteCommandCenter = interface;
  MPSkipIntervalCommandEvent = interface;
  MPSeekCommandEvent = interface;
  MPRatingCommandEvent = interface;
  MPChangePlaybackRateCommandEvent = interface;
  MPFeedbackCommandEvent = interface;
  MPChangeLanguageOptionCommandEvent = interface;
  MPChangePlaybackPositionCommandEvent = interface;
  MPVolumeView = interface;

  // ===== Framework typedefs =====
{$M+}
  NSInteger = Integer;
  MPErrorCode = NSInteger;
  MPMediaEntityPersistentID = UInt64;
  TMediaPlayerUsingBlock = procedure(param1: NSString; param2: Pointer;
    param3: PBoolean) of object;
  NSUInteger = Cardinal;
  MPMediaType = NSUInteger;
  NSTimeInterval = Double;
  CGFloat = Single;
  CGSize = CGSize = record width: CGFloat;
height:
CGFloat;
end;
PCGSize = ^CGSize;;
CGPoint = CGPoint = record x: CGFloat;
y:
CGFloat;
end;
PCGPoint = ^CGPoint;;
CGRect = CGRect = record origin: CGPoint;
size:
CGSize;
end;
PCGRect = ^CGRect;;
MPMediaLibraryAuthorizationStatus = NSInteger;
TMediaPlayerHandler =
procedure(param1: MPMediaLibraryAuthorizationStatus) of object;
TMediaPlayerCompletionHandler =
procedure(param1: NSArray; param2: NSError) of object;
TMediaPlayerCompletionHandler1 =
procedure(param1: MPMediaPlaylist; param2: NSError) of object;
MPMediaPlaylistAttribute = NSUInteger;
TMediaPlayerCompletionHandler2 =
procedure(param1: NSError) of object;
MPMediaGrouping = NSInteger;
MPMediaPredicateComparison = NSInteger;
NSRange = _NSRange = record location: NSUInteger;
length:
NSUInteger;
end;
P_NSRange = ^_NSRange;;
MPMovieScalingMode = NSInteger;
MPMoviePlaybackState = NSInteger;
MPMovieLoadState = NSUInteger;
MPMovieRepeatMode = NSInteger;
MPMovieControlStyle = NSInteger;
MPMovieFinishReason = NSInteger;
MPMovieMediaTypeMask = NSUInteger;
MPMovieSourceType = NSInteger;
MPMovieTimeOption = NSInteger;
NSStringEncoding = NSUInteger;
MPMusicPlaybackState = NSInteger;
MPMusicRepeatMode = NSInteger;
MPMusicShuffleMode = NSInteger;
MPNowPlayingInfoLanguageOptionType = NSUInteger;
MPRemoteCommandHandlerStatus = NSInteger;
SEL = SEL *;
TMediaPlayerHandler1 =
function(param1: MPRemoteCommandEvent): MPRemoteCommandHandlerStatus;
cdecl;
MPSeekCommandEventType = NSUInteger;
UIControlState = NSUInteger;
// ===== Interface declarations =====

MPNowPlayingInfoLanguageOptionClass = interface(NSObjectClass)
  ['{B79E0616-E06E-4AFB-B8E2-177CB457EEC7}']
end;
MPNowPlayingInfoLanguageOption = interface(NSObject)
  ['{8D2EFC6E-6A33-45B0-B107-78ACD547677B}']
function initWithType(languageOptionType: MPNowPlayingInfoLanguageOptionType;
  languageTag: NSString; characteristics: NSArray; displayName: NSString;
  identifier: NSString): Pointer { instancetype };
cdecl;

function isAutomaticLegibleLanguageOption: Boolean; cdecl;
  function isAutomaticAudibleLanguageOption: Boolean; cdecl;
    function languageOptionType: MPNowPlayingInfoLanguageOptionType; cdecl;
      function languageTag: NSString; cdecl;
        function languageOptionCharacteristics: NSArray; cdecl;
          function displayName: NSString; cdecl;
            function identifier: NSString; cdecl;
            end;

        TMPNowPlayingInfoLanguageOption = class
          (TOCGenericImport<MPNowPlayingInfoLanguageOptionClass,
          MPNowPlayingInfoLanguageOption>)
        end;
    PMPNowPlayingInfoLanguageOption = Pointer;

    MPNowPlayingInfoLanguageOptionGroupClass = interface(NSObjectClass)
      ['{7B8BD42B-C3B4-4359-AB5E-905B78CB2B5C}']
    end;
MPNowPlayingInfoLanguageOptionGroup = interface(NSObject)
  ['{79C5151A-C5D8-439C-AE02-E35CAB854057}']
function initWithLanguageOptions(languageOptions: NSArray;
  defaultLanguageOption: MPNowPlayingInfoLanguageOption;
  allowEmptySelection: Boolean): Pointer { instancetype };
cdecl;
  function languageOptions: NSArray; cdecl;
    function defaultLanguageOption: MPNowPlayingInfoLanguageOption; cdecl;
      function allowEmptySelection: Boolean; cdecl;
      end;

  TMPNowPlayingInfoLanguageOptionGroup = class
    (TOCGenericImport<MPNowPlayingInfoLanguageOptionGroupClass,
    MPNowPlayingInfoLanguageOptionGroup>)
  end;
PMPNowPlayingInfoLanguageOptionGroup = Pointer;

MPNowPlayingInfoLanguageOptionAdditions = interface(IObjectiveC)
  ['{9AF5523B-3214-4203-B047-D7C6F75D82B1}']
function makeNowPlayingInfoLanguageOption: MPNowPlayingInfoLanguageOption;
cdecl;

function makeNowPlayingInfoLanguageOptionGroup
  : MPNowPlayingInfoLanguageOptionGroup; cdecl;
end;

MPMediaItemArtworkClass = interface(NSObjectClass)
  ['{DDB90968-088F-4E0D-A750-DFECFED44B75}']
end;
MPMediaItemArtwork = interface(NSObject)
  ['{D8511531-49BF-40E4-B6A9-BD462395806D}']
function initWithImage(image: UIImage): Pointer { instancetype };
cdecl;

function imageWithSize(size: CGSize): UIImage; cdecl;
  function bounds: CGRect; cdecl;
    function imageCropRect: CGRect; cdecl;
    end;

TMPMediaItemArtwork = class(TOCGenericImport<MPMediaItemArtworkClass,
  MPMediaItemArtwork>)
end;
PMPMediaItemArtwork = Pointer;

MPContentItemClass = interface(NSObjectClass)
  ['{A6DE5C2E-F9D8-4B25-951A-4E37B91C4651}']
end;
MPContentItem = interface(NSObject)['{A47CB8E6-1F91-4608-AA8E-EFDD858D4CBA}']
function initWithIdentifier(identifier: NSString): Pointer { instancetype };
cdecl;

function identifier: NSString; cdecl;
  procedure setTitle(title: NSString); cdecl;
    function title: NSString; cdecl;
      procedure setSubtitle(subtitle: NSString); cdecl;
        function subtitle: NSString; cdecl;
          procedure setArtwork(artwork: MPMediaItemArtwork); cdecl;
            function artwork: MPMediaItemArtwork; cdecl;
              procedure setContainer(container: Boolean); cdecl;
                function isContainer: Boolean; cdecl;
                  procedure setPlayable(playable: Boolean); cdecl;
                    function isPlayable: Boolean; cdecl;
                      procedure setPlaybackProgress(playbackProgress
                        : Single); cdecl;
                        function playbackProgress: Single; cdecl;
                        end;

                    TMPContentItem = class
                      (TOCGenericImport<MPContentItemClass, MPContentItem>)
                    end;
                PMPContentItem = Pointer;

                MPMediaLibraryClass = interface(NSObjectClass)
                  ['{EFD2A445-16C1-45FB-859E-DE8EB4AA4398}']
                { class } function defaultMediaLibrary: MPMediaLibrary;
                cdecl;
                { class } function authorizationStatus
                    : MPMediaLibraryAuthorizationStatus; cdecl;
                  { class } procedure requestAuthorization
                      (handler: TMediaPlayerHandler); cdecl;
                    end;
                MPMediaLibrary = interface(NSObject)
                  ['{F403F6C1-7B10-4FED-87EB-6D3F9EAFB5D3}']
                function lastModifiedDate: NSDate;
                cdecl;
                  procedure beginGeneratingLibraryChangeNotifications; cdecl;
                    procedure endGeneratingLibraryChangeNotifications; cdecl;
                      procedure addItemWithProductID(productID: NSString;
                        completionHandler
                        : TMediaPlayerCompletionHandler); cdecl;
                        procedure getPlaylistWithUUID(uuid: NSUUID;
                          creationMetadata: MPMediaPlaylistCreationMetadata;
                          completionHandler
                          : TMediaPlayerCompletionHandler1); cdecl;
                        end;

                    TMPMediaLibrary = class
                      (TOCGenericImport<MPMediaLibraryClass, MPMediaLibrary>)
                    end;
                PMPMediaLibrary = Pointer;

                MPMediaEntityClass = interface(NSObjectClass)
                  ['{091121AF-7BAF-4638-A987-2A91A7558779}']
                { class } function canFilterByProperty(&property: NSString)
                  : Boolean;
                cdecl;
                end;
            MPMediaEntity = interface(NSObject)
              ['{74F2FF52-0E28-4085-A98B-87735D38D654}']
            procedure enumerateValuesForProperties(properties: NSSet;
              usingBlock: TMediaPlayerUsingBlock);
            cdecl;
              function objectForKeyedSubscript(key: Pointer): Pointer; cdecl;
                function valueForProperty(&property: NSString): Pointer; cdecl;
                  function persistentID: MPMediaEntityPersistentID; cdecl;
                  end;

              TMPMediaEntity = class(TOCGenericImport<MPMediaEntityClass,
                MPMediaEntity>)
              end;
          PMPMediaEntity = Pointer;

          MPMediaItemClass = interface(MPMediaEntityClass)
            ['{9C6698D8-14A5-4D2E-8C67-07A814F62F95}']
          { class } function persistentIDPropertyForGroupingType
            (groupingType: MPMediaGrouping): NSString;
          cdecl;
          { class } function titlePropertyForGroupingType
              (groupingType: MPMediaGrouping): NSString; cdecl;
            end;
        MPMediaItem = interface(MPMediaEntity)
          ['{8674A775-613A-4695-A791-5A0B09F2CBC9}']
        function persistentID: MPMediaEntityPersistentID;
        cdecl;
          function mediaType: MPMediaType; cdecl;
            function title: NSString; cdecl;
              function albumTitle: NSString; cdecl;
                function albumPersistentID: MPMediaEntityPersistentID; cdecl;
                  function artist: NSString; cdecl;
                    function artistPersistentID
                      : MPMediaEntityPersistentID; cdecl;
                      function albumArtist: NSString; cdecl;
                        function albumArtistPersistentID
                          : MPMediaEntityPersistentID; cdecl;
                          function genre: NSString; cdecl;
                            function genrePersistentID
                              : MPMediaEntityPersistentID; cdecl;
                              function composer: NSString; cdecl;
                                function composerPersistentID
                                  : MPMediaEntityPersistentID; cdecl;
                                  function playbackDuration
                                    : NSTimeInterval; cdecl;
                                    function albumTrackNumber
                                      : NSUInteger; cdecl;
                                      function albumTrackCount
                                        : NSUInteger; cdecl;
                                        function discNumber: NSUInteger; cdecl;
                                        function discCount: NSUInteger; cdecl;
                                        function artwork
                                        : MPMediaItemArtwork; cdecl;
                                        function lyrics: NSString; cdecl;
                                        function isCompilation: Boolean; cdecl;
                                        function releaseDate: NSDate; cdecl;
                                        function beatsPerMinute
                                        : NSUInteger; cdecl;
                                        function comments: NSString; cdecl;
                                        function assetURL: NSURL; cdecl;
                                        function isCloudItem: Boolean; cdecl;
                                        function hasProtectedAsset
                                        : Boolean; cdecl;
                                        function podcastTitle: NSString; cdecl;
                                        function podcastPersistentID
                                        : MPMediaEntityPersistentID; cdecl;
                                        function playCount: NSUInteger; cdecl;
                                        function skipCount: NSUInteger; cdecl;
                                        function rating: NSUInteger; cdecl;
                                        function lastPlayedDate: NSDate; cdecl;
                                        function userGrouping: NSString; cdecl;
                                        function bookmarkTime
                                        : NSTimeInterval; cdecl;
                                        end;

                                        TMPMediaItem = class
                                        (TOCGenericImport<MPMediaItemClass,
                                        MPMediaItem>)
                                        end;
                                        PMPMediaItem = Pointer;

                                        MPMediaItemCollectionClass = interface
                                        (MPMediaEntityClass)
                                        ['{213C7781-0A13-4BAF-9D3D-F41C02E9FA78}']
                                        { class } function collectionWithItems
                                        (items: NSArray): MPMediaItemCollection;
                                        cdecl;
                                        end;
                                        MPMediaItemCollection = interface
                                        (MPMediaEntity)
                                        ['{D9822719-7031-4F6A-BEAD-49D83C3FC28D}']
                                        function initWithItems(items: NSArray)
                                        : Pointer { instancetype };
                                        cdecl;
                                        function items: NSArray; cdecl;
                                        function representativeItem
                                        : MPMediaItem; cdecl;
                                        function count: NSUInteger; cdecl;
                                        function mediaTypes: MPMediaType; cdecl;
                                        end;

                                        TMPMediaItemCollection = class
                                        (TOCGenericImport<
                                        MPMediaItemCollectionClass,
                                        MPMediaItemCollection>)
                                        end;
                                        PMPMediaItemCollection = Pointer;

                                        MPMediaQueryClass = interface
                                        (NSObjectClass)
                                        ['{E9E71681-1B00-4A0D-8326-E72C09D4A32A}']
                                        { class } function albumsQuery
                                        : MPMediaQuery;
                                        cdecl;
                                        { class } function artistsQuery
                                        : MPMediaQuery; cdecl;
                                        { class } function songsQuery
                                        : MPMediaQuery; cdecl;
                                        { class } function playlistsQuery
                                        : MPMediaQuery; cdecl;
                                        { class } function podcastsQuery
                                        : MPMediaQuery; cdecl;
                                        { class } function audiobooksQuery
                                        : MPMediaQuery; cdecl;
                                        { class } function compilationsQuery
                                        : MPMediaQuery; cdecl;
                                        { class } function composersQuery
                                        : MPMediaQuery; cdecl;
                                        { class } function genresQuery
                                        : MPMediaQuery; cdecl;
                                        end;
                                        MPMediaQuery = interface(NSObject)
                                        ['{18C1FE04-3359-4538-999F-586E732EB2D3}']
                                        function initWithFilterPredicates
                                        (filterPredicates: NSSet)
                                        : Pointer { instancetype };
                                        cdecl;
                                        procedure setFilterPredicates
                                        (filterPredicates: NSSet); cdecl;
                                        function filterPredicates: NSSet; cdecl;
                                        procedure addFilterPredicate
                                        (predicate: MPMediaPredicate); cdecl;
                                        procedure removeFilterPredicate
                                        (predicate: MPMediaPredicate); cdecl;
                                        function items: NSArray; cdecl;
                                        function collections: NSArray; cdecl;
                                        procedure setGroupingType
                                        (groupingType: MPMediaGrouping); cdecl;
                                        function groupingType
                                        : MPMediaGrouping; cdecl;
                                        function itemSections: NSArray; cdecl;
                                        function collectionSections
                                        : NSArray; cdecl;
                                        end;

                                        TMPMediaQuery = class
                                        (TOCGenericImport<MPMediaQueryClass,
                                        MPMediaQuery>)
                                        end;
                                        PMPMediaQuery = Pointer;

                                        MPMediaPlaylistClass = interface
                                        (MPMediaItemCollectionClass)
                                        ['{7C82328F-A938-40D7-830A-8DA4B6DEADE7}']
                                        end;
                                        MPMediaPlaylist = interface
                                        (MPMediaItemCollection)
                                        ['{4FF571F4-324B-46DF-9B47-85FB103EE256}']
                                        function persistentID
                                        : MPMediaEntityPersistentID;
                                        cdecl;
                                        function name: NSString; cdecl;
                                        function playlistAttributes
                                        : MPMediaPlaylistAttribute; cdecl;
                                        function seedItems: NSArray; cdecl;
                                        function descriptionText
                                        : NSString; cdecl;
                                        function authorDisplayName
                                        : NSString; cdecl;
                                        procedure addItemWithProductID
                                        (productID: NSString;
                                        completionHandler
                                        : TMediaPlayerCompletionHandler2);
                                        cdecl;
                                        procedure addMediaItems
                                        (mediaItems: NSArray;
                                        completionHandler
                                        : TMediaPlayerCompletionHandler2);
                                        cdecl;
                                        end;

                                        TMPMediaPlaylist = class
                                        (TOCGenericImport<MPMediaPlaylistClass,
                                        MPMediaPlaylist>)
                                        end;
                                        PMPMediaPlaylist = Pointer;

                                        MPMediaPlaylistCreationMetadataClass =
                                        interface(NSObjectClass)
                                        ['{44791E6C-83E1-40EE-95B0-6E60BE79DBDA}']
                                        end;
                                        MPMediaPlaylistCreationMetadata =
                                        interface(NSObject)
                                        ['{714B72C8-259A-4B8A-80D2-AEA1D2A589C9}']
                                        function initWithName(name: NSString)
                                        : Pointer { instancetype };
                                        cdecl;
                                        function name: NSString; cdecl;
                                        procedure setAuthorDisplayName
                                        (authorDisplayName: NSString); cdecl;
                                        function authorDisplayName
                                        : NSString; cdecl;
                                        procedure setDescriptionText
                                        (descriptionText: NSString); cdecl;
                                        function descriptionText
                                        : NSString; cdecl;
                                        end;

                                        TMPMediaPlaylistCreationMetadata = class
                                        (TOCGenericImport<
                                        MPMediaPlaylistCreationMetadataClass,
                                        MPMediaPlaylistCreationMetadata>)
                                        end;
                                        PMPMediaPlaylistCreationMetadata =
                                        Pointer;

                                        MPMediaPickerControllerClass = interface
                                        (UIViewControllerClass)
                                        ['{981D3D83-3A77-4BEB-9CBF-7B98DF7E5521}']
                                        end;
                                        MPMediaPickerController = interface
                                        (UIViewController)
                                        ['{83E9DE86-C16F-4455-A3B9-2B8AFDA6E99B}']
                                        function initWithMediaTypes
                                        (mediaTypes: MPMediaType)
                                        : Pointer { instancetype };
                                        cdecl;
                                        function mediaTypes: MPMediaType; cdecl;
                                        procedure setDelegate
                                        (delegate: Pointer); cdecl;
                                        function delegate: Pointer; cdecl;
                                        procedure setAllowsPickingMultipleItems
                                        (allowsPickingMultipleItems
                                        : Boolean); cdecl;
                                        function allowsPickingMultipleItems
                                        : Boolean; cdecl;
                                        procedure setShowsCloudItems
                                        (showsCloudItems: Boolean); cdecl;
                                        function showsCloudItems
                                        : Boolean; cdecl;
                                        procedure setShowsItemsWithProtectedAssets
                                        (showsItemsWithProtectedAssets
                                        : Boolean); cdecl;
                                        function showsItemsWithProtectedAssets
                                        : Boolean; cdecl;
                                        procedure setPrompt
                                        (prompt: NSString); cdecl;
                                        function prompt: NSString; cdecl;
                                        end;

                                        TMPMediaPickerController = class
                                        (TOCGenericImport<
                                        MPMediaPickerControllerClass,
                                        MPMediaPickerController>)
                                        end;
                                        PMPMediaPickerController = Pointer;

                                        MPMediaPredicateClass = interface
                                        (NSObjectClass)
                                        ['{C4561C13-5D01-4C18-8601-C1DD91AE7AE7}']
                                        end;
                                        MPMediaPredicate = interface(NSObject)
                                        ['{6CB752B4-004D-4A63-90E6-7CAD57AC89E6}']
                                        end;

                                        TMPMediaPredicate = class
                                        (TOCGenericImport<MPMediaPredicateClass,
                                        MPMediaPredicate>)
                                        end;
                                        PMPMediaPredicate = Pointer;

                                        MPMediaQuerySectionClass = interface
                                        (NSObjectClass)
                                        ['{5B350F19-F0E2-425B-A002-773BAC129BAC}']
                                        end;
                                        MPMediaQuerySection = interface
                                        (NSObject)
                                        ['{F0169947-1506-4014-B2BF-180E5C1FB0F6}']
                                        function title: NSString;
                                        cdecl;
                                        function range: NSRange; cdecl;
                                        end;

                                        TMPMediaQuerySection = class
                                        (TOCGenericImport<
                                        MPMediaQuerySectionClass,
                                        MPMediaQuerySection>)
                                        end;
                                        PMPMediaQuerySection = Pointer;

                                        MPMediaPropertyPredicateClass =
                                        interface(MPMediaPredicateClass)
                                        ['{078B72CE-E7A1-4286-A651-A342968EFFA4}']
                                        [MethodName
                                        ('predicateWithValue:forProperty:')]
                                        { class } function
                                        predicateWithValueForProperty
                                        (value: Pointer; forProperty: NSString)
                                        : MPMediaPropertyPredicate;
                                        cdecl;
                                        [MethodName
                                        ('predicateWithValue:forProperty:comparisonType:')
                                        ]
                                        { class } function
                                        predicateWithValueForPropertyComparisonType
                                        (value: Pointer; forProperty: NSString;
                                        comparisonType
                                        : MPMediaPredicateComparison)
                                        : MPMediaPropertyPredicate; cdecl;
                                        end;
                                        MPMediaPropertyPredicate = interface
                                        (MPMediaPredicate)
                                        ['{39464592-9FE2-4526-83F3-4C6C8A6A03C9}']
                                        function &property: NSString;
                                        cdecl;
                                        function value: Pointer; cdecl;
                                        function comparisonType
                                        : MPMediaPredicateComparison; cdecl;
                                        end;

                                        TMPMediaPropertyPredicate = class
                                        (TOCGenericImport<
                                        MPMediaPropertyPredicateClass,
                                        MPMediaPropertyPredicate>)
                                        end;
                                        PMPMediaPropertyPredicate = Pointer;

                                        MPMovieAccessLogClass = interface
                                        (NSObjectClass)
                                        ['{779264B8-0088-4793-B8AE-32EF43D6A28C}']
                                        end;
                                        MPMovieAccessLog = interface(NSObject)
                                        ['{A1C1C5BC-43F1-47E9-86C6-30A78979E37A}']
                                        function extendedLogData: NSData;
                                        cdecl;
                                        function extendedLogDataStringEncoding
                                        : NSStringEncoding; cdecl;
                                        function events: NSArray; cdecl;
                                        end;

                                        TMPMovieAccessLog = class
                                        (TOCGenericImport<MPMovieAccessLogClass,
                                        MPMovieAccessLog>)
                                        end;
                                        PMPMovieAccessLog = Pointer;

                                        MPMovieErrorLogClass = interface
                                        (NSObjectClass)
                                        ['{26CACBC9-1E80-4F47-91BC-57D3B84D9C16}']
                                        end;
                                        MPMovieErrorLog = interface(NSObject)
                                        ['{4974C945-AA71-4B54-9D46-1FB1C558DFD2}']
                                        function extendedLogData: NSData;
                                        cdecl;
                                        function extendedLogDataStringEncoding
                                        : NSStringEncoding; cdecl;
                                        function events: NSArray; cdecl;
                                        end;

                                        TMPMovieErrorLog = class
                                        (TOCGenericImport<MPMovieErrorLogClass,
                                        MPMovieErrorLog>)
                                        end;
                                        PMPMovieErrorLog = Pointer;

                                        MPMoviePlayerControllerClass = interface
                                        (NSObjectClass)
                                        ['{644C6784-D8A2-474B-B694-98FFF33CD0F8}']
                                        end;
                                        MPMoviePlayerController = interface
                                        (NSObject)
                                        ['{F3B9E7F5-4D73-4781-A49A-52C072CB11D7}']
                                        function initWithContentURL(url: NSURL)
                                        : Pointer { instancetype };
                                        cdecl;
                                        procedure setContentURL
                                        (contentURL: NSURL); cdecl;
                                        function contentURL: NSURL; cdecl;
                                        function view: UIView; cdecl;
                                        function backgroundView: UIView; cdecl;
                                        function playbackState
                                        : MPMoviePlaybackState; cdecl;
                                        function loadState
                                        : MPMovieLoadState; cdecl;
                                        procedure setControlStyle
                                        (controlStyle
                                        : MPMovieControlStyle); cdecl;
                                        function controlStyle
                                        : MPMovieControlStyle; cdecl;
                                        procedure setRepeatMode
                                        (repeatMode: MPMovieRepeatMode); cdecl;
                                        function repeatMode
                                        : MPMovieRepeatMode; cdecl;
                                        procedure setShouldAutoplay
                                        (shouldAutoplay: Boolean); cdecl;
                                        function shouldAutoplay: Boolean; cdecl;
                                        [MethodName('setFullscreen:')]
                                        procedure setFullscreen
                                        (fullscreen: Boolean); cdecl;
                                        function isFullscreen: Boolean; cdecl;
                                        [MethodName('setFullscreen:animated:')]
                                        procedure setFullscreenAnimated
                                        (fullscreen: Boolean;
                                        animated: Boolean); cdecl;
                                        procedure setScalingMode
                                        (scalingMode
                                        : MPMovieScalingMode); cdecl;
                                        function scalingMode
                                        : MPMovieScalingMode; cdecl;
                                        function readyForDisplay
                                        : Boolean; cdecl;
                                        function movieMediaTypes
                                        : MPMovieMediaTypeMask; cdecl;
                                        procedure setMovieSourceType
                                        (movieSourceType
                                        : MPMovieSourceType); cdecl;
                                        function movieSourceType
                                        : MPMovieSourceType; cdecl;
                                        function duration
                                        : NSTimeInterval; cdecl;
                                        function playableDuration
                                        : NSTimeInterval; cdecl;
                                        function naturalSize: CGSize; cdecl;
                                        procedure setInitialPlaybackTime
                                        (initialPlaybackTime
                                        : NSTimeInterval); cdecl;
                                        function initialPlaybackTime
                                        : NSTimeInterval; cdecl;
                                        procedure setEndPlaybackTime
                                        (endPlaybackTime
                                        : NSTimeInterval); cdecl;
                                        function endPlaybackTime
                                        : NSTimeInterval; cdecl;
                                        procedure setAllowsAirPlay
                                        (allowsAirPlay: Boolean); cdecl;
                                        function allowsAirPlay: Boolean; cdecl;
                                        function isAirPlayVideoActive
                                        : Boolean; cdecl;
                                        function thumbnailImageAtTime
                                        (playbackTime: NSTimeInterval;
                                        timeOption: MPMovieTimeOption)
                                        : UIImage; cdecl;
                                        procedure requestThumbnailImagesAtTimes
                                        (playbackTimes: NSArray;
                                        timeOption: MPMovieTimeOption); cdecl;
                                        procedure cancelAllThumbnailImageRequests;
                                        cdecl;
                                        function timedMetadata: NSArray; cdecl;
                                        function accessLog
                                        : MPMovieAccessLog; cdecl;
                                        function errorLog
                                        : MPMovieErrorLog; cdecl;
                                        procedure setUseApplicationAudioSession
                                        (useApplicationAudioSession
                                        : Boolean); cdecl;
                                        function useApplicationAudioSession
                                        : Boolean; cdecl;
                                        end;

                                        TMPMoviePlayerController = class
                                        (TOCGenericImport<
                                        MPMoviePlayerControllerClass,
                                        MPMoviePlayerController>)
                                        end;
                                        PMPMoviePlayerController = Pointer;

                                        MPTimedMetadataClass = interface
                                        (NSObjectClass)
                                        ['{65F99B4A-FAC6-48AA-994E-15BC4985AC98}']
                                        end;
                                        MPTimedMetadata = interface(NSObject)
                                        ['{1CF06843-0712-4346-A539-119CAE11EFAA}']
                                        function key: NSString;
                                        cdecl;
                                        function keyspace: NSString; cdecl;
                                        function value: Pointer; cdecl;
                                        function timestamp
                                        : NSTimeInterval; cdecl;
                                        function allMetadata
                                        : NSDictionary; cdecl;
                                        end;

                                        TMPTimedMetadata = class
                                        (TOCGenericImport<MPTimedMetadataClass,
                                        MPTimedMetadata>)
                                        end;
                                        PMPTimedMetadata = Pointer;

                                        MPMovieAccessLogEventClass = interface
                                        (NSObjectClass)
                                        ['{CC4A7722-9710-471B-B801-9D193481425C}']
                                        end;
                                        MPMovieAccessLogEvent = interface
                                        (NSObject)
                                        ['{545603B7-A8B8-44C9-AFED-C459ABB893B2}']
                                        function numberOfSegmentsDownloaded
                                        : NSUInteger;
                                        cdecl;
                                        function playbackStartDate
                                        : NSDate; cdecl;
                                        function URI: NSString; cdecl;
                                        function serverAddress: NSString; cdecl;
                                        function numberOfServerAddressChanges
                                        : NSUInteger; cdecl;
                                        function playbackSessionID
                                        : NSString; cdecl;
                                        function playbackStartOffset
                                        : NSTimeInterval; cdecl;
                                        function segmentsDownloadedDuration
                                        : NSTimeInterval; cdecl;
                                        function durationWatched
                                        : NSTimeInterval; cdecl;
                                        function numberOfStalls
                                        : NSInteger; cdecl;
                                        function numberOfBytesTransferred
                                        : Int64; cdecl;
                                        function observedBitrate: Double; cdecl;
                                        function indicatedBitrate
                                        : Double; cdecl;
                                        function numberOfDroppedVideoFrames
                                        : NSInteger; cdecl;
                                        end;

                                        TMPMovieAccessLogEvent = class
                                        (TOCGenericImport<
                                        MPMovieAccessLogEventClass,
                                        MPMovieAccessLogEvent>)
                                        end;
                                        PMPMovieAccessLogEvent = Pointer;

                                        MPMovieErrorLogEventClass = interface
                                        (NSObjectClass)
                                        ['{D677C231-7A02-4D56-87A7-231A044351DD}']
                                        end;
                                        MPMovieErrorLogEvent = interface
                                        (NSObject)
                                        ['{8731B87A-9B4E-439B-9652-CF72800C81AD}']
                                        function date: NSDate;
                                        cdecl;
                                        function URI: NSString; cdecl;
                                        function serverAddress: NSString; cdecl;
                                        function playbackSessionID
                                        : NSString; cdecl;
                                        function errorStatusCode
                                        : NSInteger; cdecl;
                                        function errorDomain: NSString; cdecl;
                                        function errorComment: NSString; cdecl;
                                        end;

                                        TMPMovieErrorLogEvent = class
                                        (TOCGenericImport<
                                        MPMovieErrorLogEventClass,
                                        MPMovieErrorLogEvent>)
                                        end;
                                        PMPMovieErrorLogEvent = Pointer;

                                        MPMoviePlayerViewControllerClass =
                                        interface(UIViewControllerClass)
                                        ['{D159E1F3-9555-400C-B304-A788F3C961D9}']
                                        end;
                                        MPMoviePlayerViewController = interface
                                        (UIViewController)
                                        ['{546E874B-E816-4309-9F4E-D7469C13BF54}']
                                        function initWithContentURL
                                        (contentURL: NSURL)
                                        : Pointer { instancetype };
                                        cdecl;
                                        function moviePlayer
                                        : MPMoviePlayerController; cdecl;
                                        procedure presentMoviePlayerViewControllerAnimated
                                        (moviePlayerViewController
                                        : MPMoviePlayerViewController); cdecl;
                                        procedure dismissMoviePlayerViewControllerAnimated;
                                        cdecl;
                                        end;

                                        TMPMoviePlayerViewController = class
                                        (TOCGenericImport<
                                        MPMoviePlayerViewControllerClass,
                                        MPMoviePlayerViewController>)
                                        end;
                                        PMPMoviePlayerViewController = Pointer;

                                        MPMusicPlayerControllerClass = interface
                                        (NSObjectClass)
                                        ['{3894CCAC-72B7-4E8E-AD21-2A3BCFC9AD3A}']
                                        { class } function
                                        applicationMusicPlayer
                                        : MPMusicPlayerController;
                                        cdecl;
                                        { class } function systemMusicPlayer
                                        : MPMusicPlayerController; cdecl;
                                        { class } function iPodMusicPlayer
                                        : MPMusicPlayerController; cdecl;
                                        end;
                                        MPMusicPlayerController = interface
                                        (NSObject)
                                        ['{6332AB49-7F21-4EE8-A464-255CEA057917}']
                                        function playbackState
                                        : MPMusicPlaybackState;
                                        cdecl;
                                        procedure setRepeatMode
                                        (repeatMode: MPMusicRepeatMode); cdecl;
                                        function repeatMode
                                        : MPMusicRepeatMode; cdecl;
                                        procedure setShuffleMode
                                        (shuffleMode
                                        : MPMusicShuffleMode); cdecl;
                                        function shuffleMode
                                        : MPMusicShuffleMode; cdecl;
                                        procedure setVolume
                                        (volume: Single); cdecl;
                                        function volume: Single; cdecl;
                                        procedure setNowPlayingItem
                                        (nowPlayingItem: MPMediaItem); cdecl;
                                        function nowPlayingItem
                                        : MPMediaItem; cdecl;
                                        function indexOfNowPlayingItem
                                        : NSUInteger; cdecl;
                                        procedure setQueueWithQuery
                                        (query: MPMediaQuery); cdecl;
                                        procedure setQueueWithItemCollection
                                        (itemCollection
                                        : MPMediaItemCollection); cdecl;
                                        procedure setQueueWithStoreIDs
                                        (storeIDs: NSArray); cdecl;
                                        procedure skipToNextItem; cdecl;
                                        procedure skipToBeginning; cdecl;
                                        procedure skipToPreviousItem; cdecl;
                                        procedure beginGeneratingPlaybackNotifications;
                                        cdecl;
                                        procedure endGeneratingPlaybackNotifications;
                                        cdecl;
                                        end;

                                        TMPMusicPlayerController = class
                                        (TOCGenericImport<
                                        MPMusicPlayerControllerClass,
                                        MPMusicPlayerController>)
                                        end;
                                        PMPMusicPlayerController = Pointer;

                                        MPNowPlayingInfoCenterClass = interface
                                        (NSObjectClass)
                                        ['{06A7C2A4-6782-4D33-B372-BF73658A9684}']
                                        { class } function defaultCenter
                                        : MPNowPlayingInfoCenter;
                                        cdecl;
                                        end;
                                        MPNowPlayingInfoCenter = interface
                                        (NSObject)
                                        ['{A55077D5-0EEB-419A-B574-2246AA8B53FE}']
                                        procedure setNowPlayingInfo
                                        (nowPlayingInfo: NSDictionary);
                                        cdecl;
                                        function nowPlayingInfo
                                        : NSDictionary; cdecl;
                                        end;

                                        TMPNowPlayingInfoCenter = class
                                        (TOCGenericImport<
                                        MPNowPlayingInfoCenterClass,
                                        MPNowPlayingInfoCenter>)
                                        end;
                                        PMPNowPlayingInfoCenter = Pointer;

                                        MPPlayableContentManagerClass =
                                        interface(NSObjectClass)
                                        ['{8A2BDA3B-B891-436F-BE99-2ABFBE9B4E19}']
                                        { class } function sharedContentManager
                                        : Pointer { instancetype };
                                        cdecl;
                                        end;
                                        MPPlayableContentManager = interface
                                        (NSObject)
                                        ['{ADD3D5A0-1B6C-42D8-81F8-1C3E2985141A}']
                                        procedure setDataSource
                                        (dataSource: Pointer);
                                        cdecl;
                                        function dataSource: Pointer; cdecl;
                                        procedure setDelegate
                                        (delegate: Pointer); cdecl;
                                        function delegate: Pointer; cdecl;
                                        function context
                                        : MPPlayableContentManagerContext;
                                        cdecl;
                                        procedure reloadData; cdecl;
                                        procedure beginUpdates; cdecl;
                                        procedure endUpdates; cdecl;
                                        end;

                                        TMPPlayableContentManager = class
                                        (TOCGenericImport<
                                        MPPlayableContentManagerClass,
                                        MPPlayableContentManager>)
                                        end;
                                        PMPPlayableContentManager = Pointer;

                                        MPPlayableContentManagerContextClass =
                                        interface(NSObjectClass)
                                        ['{89977D98-C9D7-4DF8-A4F4-15991BD605BA}']
                                        end;
                                        MPPlayableContentManagerContext =
                                        interface(NSObject)
                                        ['{93E2362F-2644-46F8-84D0-916F2949D26B}']
                                        function enforcedContentItemsCount
                                        : NSInteger;
                                        cdecl;
                                        function enforcedContentTreeDepth
                                        : NSInteger; cdecl;
                                        function contentLimitsEnforced
                                        : Boolean; cdecl;
                                        function contentLimitsEnabled
                                        : Boolean; cdecl;
                                        function endpointAvailable
                                        : Boolean; cdecl;
                                        end;

                                        TMPPlayableContentManagerContext = class
                                        (TOCGenericImport<
                                        MPPlayableContentManagerContextClass,
                                        MPPlayableContentManagerContext>)
                                        end;
                                        PMPPlayableContentManagerContext =
                                        Pointer;

                                        MPRemoteCommandEventClass = interface
                                        (NSObjectClass)
                                        ['{FF413A5B-1669-4607-BC9B-C06C0034B730}']
                                        end;
                                        MPRemoteCommandEvent = interface
                                        (NSObject)
                                        ['{ED15B003-A2B6-42D4-939A-42E27869F263}']
                                        function command: MPRemoteCommand;
                                        cdecl;
                                        function timestamp
                                        : NSTimeInterval; cdecl;
                                        end;

                                        TMPRemoteCommandEvent = class
                                        (TOCGenericImport<
                                        MPRemoteCommandEventClass,
                                        MPRemoteCommandEvent>)
                                        end;
                                        PMPRemoteCommandEvent = Pointer;

                                        MPRemoteCommandClass = interface
                                        (NSObjectClass)
                                        ['{EBA66156-4AAC-44CD-A1F9-F213769BDA0F}']
                                        end;
                                        MPRemoteCommand = interface(NSObject)
                                        ['{00A7B7F2-08EB-49EF-9C77-6BC692E0C575}']
                                        procedure setEnabled(enabled: Boolean);
                                        cdecl;
                                        function isEnabled: Boolean; cdecl;
                                        procedure addTarget(target: Pointer;
                                        action: SEL); cdecl;
                                        [MethodName('removeTarget:action:')]
                                        procedure removeTargetAction
                                        (target: Pointer; action: SEL); cdecl;
                                        [MethodName('removeTarget:')]
                                        procedure removeTarget
                                        (target: Pointer); cdecl;
                                        function addTargetWithHandler
                                        (handler: TMediaPlayerHandler1)
                                        : Pointer; cdecl;
                                        end;

                                        TMPRemoteCommand = class
                                        (TOCGenericImport<MPRemoteCommandClass,
                                        MPRemoteCommand>)
                                        end;
                                        PMPRemoteCommand = Pointer;

                                        MPSkipIntervalCommandClass = interface
                                        (MPRemoteCommandClass)
                                        ['{6DA3243B-74ED-4179-8F56-10F9C045C4FD}']
                                        end;
                                        MPSkipIntervalCommand = interface
                                        (MPRemoteCommand)
                                        ['{D7717F25-C29B-42A3-AF27-570D20EF1AD1}']
                                        procedure setPreferredIntervals
                                        (preferredIntervals: NSArray);
                                        cdecl;
                                        function preferredIntervals
                                        : NSArray; cdecl;
                                        end;

                                        TMPSkipIntervalCommand = class
                                        (TOCGenericImport<
                                        MPSkipIntervalCommandClass,
                                        MPSkipIntervalCommand>)
                                        end;
                                        PMPSkipIntervalCommand = Pointer;

                                        MPFeedbackCommandClass = interface
                                        (MPRemoteCommandClass)
                                        ['{C07F3785-808E-412C-A41D-7D7E454C90E0}']
                                        end;
                                        MPFeedbackCommand = interface
                                        (MPRemoteCommand)
                                        ['{04C67176-D573-43DB-ABB4-FDFE517EAF1C}']
                                        procedure setActive(active: Boolean);
                                        cdecl;
                                        function isActive: Boolean; cdecl;
                                        procedure setLocalizedTitle
                                        (localizedTitle: NSString); cdecl;
                                        function localizedTitle
                                        : NSString; cdecl;
                                        procedure setLocalizedShortTitle
                                        (localizedShortTitle: NSString); cdecl;
                                        function localizedShortTitle
                                        : NSString; cdecl;
                                        end;

                                        TMPFeedbackCommand = class
                                        (TOCGenericImport<
                                        MPFeedbackCommandClass,
                                        MPFeedbackCommand>)
                                        end;
                                        PMPFeedbackCommand = Pointer;

                                        MPRatingCommandClass = interface
                                        (MPRemoteCommandClass)
                                        ['{CB09516B-C25A-4202-A6B3-8662A116591A}']
                                        end;
                                        MPRatingCommand = interface
                                        (MPRemoteCommand)
                                        ['{3ECDE360-D19A-413E-9C61-F665664D1AFD}']
                                        procedure setMinimumRating
                                        (minimumRating: Single);
                                        cdecl;
                                        function minimumRating: Single; cdecl;
                                        procedure setMaximumRating
                                        (maximumRating: Single); cdecl;
                                        function maximumRating: Single; cdecl;
                                        end;

                                        TMPRatingCommand = class
                                        (TOCGenericImport<MPRatingCommandClass,
                                        MPRatingCommand>)
                                        end;
                                        PMPRatingCommand = Pointer;

                                        MPChangePlaybackRateCommandClass =
                                        interface(MPRemoteCommandClass)
                                        ['{4B6230BB-4316-4A5C-911B-82F580902F0F}']
                                        end;
                                        MPChangePlaybackRateCommand = interface
                                        (MPRemoteCommand)
                                        ['{5501F965-23B1-41FE-A0C7-B038A0BD69DF}']
                                        procedure setSupportedPlaybackRates
                                        (supportedPlaybackRates: NSArray);
                                        cdecl;
                                        function supportedPlaybackRates
                                        : NSArray; cdecl;
                                        end;

                                        TMPChangePlaybackRateCommand = class
                                        (TOCGenericImport<
                                        MPChangePlaybackRateCommandClass,
                                        MPChangePlaybackRateCommand>)
                                        end;
                                        PMPChangePlaybackRateCommand = Pointer;

                                        MPChangePlaybackPositionCommandClass =
                                        interface(MPRemoteCommandClass)
                                        ['{67304A3A-46A8-47E8-94FD-2C9765828C04}']
                                        end;
                                        MPChangePlaybackPositionCommand =
                                        interface(MPRemoteCommand)
                                        ['{93E324C4-6E81-4DB5-8EF6-FE46C1378580}']
                                        end;

                                        TMPChangePlaybackPositionCommand = class
                                        (TOCGenericImport<
                                        MPChangePlaybackPositionCommandClass,
                                        MPChangePlaybackPositionCommand>)
                                        end;
                                        PMPChangePlaybackPositionCommand =
                                        Pointer;

                                        MPRemoteCommandCenterClass = interface
                                        (NSObjectClass)
                                        ['{9D0CA5D3-55DF-4367-A34A-BECF0BE2BCBA}']
                                        { class } function sharedCommandCenter
                                        : MPRemoteCommandCenter;
                                        cdecl;
                                        end;
                                        MPRemoteCommandCenter = interface
                                        (NSObject)
                                        ['{322808DA-91D1-4764-B8BA-1087BF06D78F}']
                                        function pauseCommand: MPRemoteCommand;
                                        cdecl;
                                        function playCommand
                                        : MPRemoteCommand; cdecl;
                                        function stopCommand
                                        : MPRemoteCommand; cdecl;
                                        function togglePlayPauseCommand
                                        : MPRemoteCommand; cdecl;
                                        function enableLanguageOptionCommand
                                        : MPRemoteCommand; cdecl;
                                        function disableLanguageOptionCommand
                                        : MPRemoteCommand; cdecl;
                                        function nextTrackCommand
                                        : MPRemoteCommand; cdecl;
                                        function previousTrackCommand
                                        : MPRemoteCommand; cdecl;
                                        function skipForwardCommand
                                        : MPSkipIntervalCommand; cdecl;
                                        function skipBackwardCommand
                                        : MPSkipIntervalCommand; cdecl;
                                        function seekForwardCommand
                                        : MPRemoteCommand; cdecl;
                                        function seekBackwardCommand
                                        : MPRemoteCommand; cdecl;
                                        function ratingCommand
                                        : MPRatingCommand; cdecl;
                                        function changePlaybackRateCommand
                                        : MPChangePlaybackRateCommand; cdecl;
                                        function likeCommand
                                        : MPFeedbackCommand; cdecl;
                                        function dislikeCommand
                                        : MPFeedbackCommand; cdecl;
                                        function bookmarkCommand
                                        : MPFeedbackCommand; cdecl;
                                        function changePlaybackPositionCommand
                                        : MPChangePlaybackPositionCommand;
                                        cdecl;
                                        end;

                                        TMPRemoteCommandCenter = class
                                        (TOCGenericImport<
                                        MPRemoteCommandCenterClass,
                                        MPRemoteCommandCenter>)
                                        end;
                                        PMPRemoteCommandCenter = Pointer;

                                        MPSkipIntervalCommandEventClass =
                                        interface(MPRemoteCommandEventClass)
                                        ['{AC0FAE93-514D-4F31-83A2-4760EE0FDECA}']
                                        end;
                                        MPSkipIntervalCommandEvent = interface
                                        (MPRemoteCommandEvent)
                                        ['{8DC8BF7C-B102-48D2-937C-742FFBDE1752}']
                                        function interval: NSTimeInterval;
                                        cdecl;
                                        end;

                                        TMPSkipIntervalCommandEvent = class
                                        (TOCGenericImport<
                                        MPSkipIntervalCommandEventClass,
                                        MPSkipIntervalCommandEvent>)
                                        end;
                                        PMPSkipIntervalCommandEvent = Pointer;

                                        MPSeekCommandEventClass = interface
                                        (MPRemoteCommandEventClass)
                                        ['{C4A339E9-00FB-4541-B0AC-EFA2CACDDAAA}']
                                        end;
                                        MPSeekCommandEvent = interface
                                        (MPRemoteCommandEvent)
                                        ['{6E091173-61E6-466D-B206-D2408B029996}']
                                        function &type: MPSeekCommandEventType;
                                        cdecl;
                                        end;

                                        TMPSeekCommandEvent = class
                                        (TOCGenericImport<
                                        MPSeekCommandEventClass,
                                        MPSeekCommandEvent>)
                                        end;
                                        PMPSeekCommandEvent = Pointer;

                                        MPRatingCommandEventClass = interface
                                        (MPRemoteCommandEventClass)
                                        ['{D104E367-DE40-45B7-BDDD-39FFECA06AF8}']
                                        end;
                                        MPRatingCommandEvent = interface
                                        (MPRemoteCommandEvent)
                                        ['{24F06C9D-C0AB-4B07-9D73-8068F00B464B}']
                                        function rating: Single;
                                        cdecl;
                                        end;

                                        TMPRatingCommandEvent = class
                                        (TOCGenericImport<
                                        MPRatingCommandEventClass,
                                        MPRatingCommandEvent>)
                                        end;
                                        PMPRatingCommandEvent = Pointer;

                                        MPChangePlaybackRateCommandEventClass =
                                        interface(MPRemoteCommandEventClass)
                                        ['{2F48C451-0814-468E-BF73-B96FB75626B4}']
                                        end;
                                        MPChangePlaybackRateCommandEvent =
                                        interface(MPRemoteCommandEvent)
                                        ['{AAFDB9A8-CDC9-42C3-B843-965B9E680B7D}']
                                        function playbackRate: Single;
                                        cdecl;
                                        end;

                                        TMPChangePlaybackRateCommandEvent =
                                        class(TOCGenericImport<
                                        MPChangePlaybackRateCommandEventClass,
                                        MPChangePlaybackRateCommandEvent>)
                                        end;
                                        PMPChangePlaybackRateCommandEvent =
                                        Pointer;

                                        MPFeedbackCommandEventClass = interface
                                        (MPRemoteCommandEventClass)
                                        ['{A2F41703-A8C5-4030-A0AB-D08E89E5C921}']
                                        end;
                                        MPFeedbackCommandEvent = interface
                                        (MPRemoteCommandEvent)
                                        ['{AF5E494A-AC52-4E57-8F2A-377A64B3835E}']
                                        function isNegative: Boolean;
                                        cdecl;
                                        end;

                                        TMPFeedbackCommandEvent = class
                                        (TOCGenericImport<
                                        MPFeedbackCommandEventClass,
                                        MPFeedbackCommandEvent>)
                                        end;
                                        PMPFeedbackCommandEvent = Pointer;

                                        MPChangeLanguageOptionCommandEventClass =
                                        interface(MPRemoteCommandEventClass)
                                        ['{067F5B21-3126-4273-8248-23658EC2D620}']
                                        end;
                                        MPChangeLanguageOptionCommandEvent =
                                        interface(MPRemoteCommandEvent)
                                        ['{996555B3-1BE6-4DC9-96DD-41C9FDBF71F6}']
                                        function languageOption
                                        : MPNowPlayingInfoLanguageOption;
                                        cdecl;
                                        end;

                                        TMPChangeLanguageOptionCommandEvent =
                                        class(TOCGenericImport<
                                        MPChangeLanguageOptionCommandEventClass,
                                        MPChangeLanguageOptionCommandEvent>)
                                        end;
                                    PMPChangeLanguageOptionCommandEvent =
                                      Pointer;

                                    MPChangePlaybackPositionCommandEventClass =
                                      interface(MPRemoteCommandEventClass)
                                      ['{1F0CC258-DB93-4D50-B316-C02B5D48E6C0}']
                                    end;
                                MPChangePlaybackPositionCommandEvent = interface
                                  (MPRemoteCommandEvent)
                                  ['{BAFD1DBE-E82E-41B5-A88D-E0395C7BA79E}']
                                function positionTime: NSTimeInterval;
                                cdecl;
                                end;

                            TMPChangePlaybackPositionCommandEvent = class
                              (TOCGenericImport<
                              MPChangePlaybackPositionCommandEventClass,
                              MPChangePlaybackPositionCommandEvent>)
                            end;
                        PMPChangePlaybackPositionCommandEvent = Pointer;

                        MPVolumeViewClass = interface(UIViewClass)
                          ['{EDD4A556-B733-461E-A58F-179012189837}']
                        end;
                    MPVolumeView = interface(UIView)
                      ['{157051B5-1165-48A3-8EEA-FCF38C77CB13}']
                    procedure setShowsVolumeSlider(showsVolumeSlider: Boolean);
                    cdecl;
                      function showsVolumeSlider: Boolean; cdecl;
                        procedure setShowsRouteButton(showsRouteButton
                          : Boolean); cdecl;
                          function showsRouteButton: Boolean; cdecl;
                            function areWirelessRoutesAvailable: Boolean; cdecl;
                              function isWirelessRouteActive: Boolean; cdecl;
                                procedure setMinimumVolumeSliderImage
                                  (image: UIImage;
                                  forState: UIControlState); cdecl;
                                  procedure setMaximumVolumeSliderImage
                                    (image: UIImage;
                                    forState: UIControlState); cdecl;
                                    procedure setVolumeThumbImage
                                      (image: UIImage;
                                      forState: UIControlState); cdecl;
                                      function minimumVolumeSliderImageForState
                                        (state: UIControlState): UIImage; cdecl;
                                        function maximumVolumeSliderImageForState
                                        (state: UIControlState): UIImage; cdecl;
                                        function volumeThumbImageForState
                                        (state: UIControlState): UIImage; cdecl;
                                        procedure setVolumeWarningSliderImage
                                        (volumeWarningSliderImage
                                        : UIImage); cdecl;
                                        function volumeWarningSliderImage
                                        : UIImage; cdecl;
                                        function volumeSliderRectForBounds
                                        (bounds: CGRect): CGRect; cdecl;
                                        function volumeThumbRectForBounds
                                        (bounds: CGRect;
                                        volumeSliderRect: CGRect; value: Single)
                                        : CGRect; cdecl;
                                        procedure setRouteButtonImage
                                        (image: UIImage;
                                        forState: UIControlState); cdecl;
                                        function routeButtonImageForState
                                        (state: UIControlState): UIImage; cdecl;
                                        function routeButtonRectForBounds
                                        (bounds: CGRect): CGRect; cdecl;
                                        end;

                                        TMPVolumeView = class
                                        (TOCGenericImport<MPVolumeViewClass,
                                        MPVolumeView>)
                                        end;
                                        PMPVolumeView = Pointer;

                                        // ===== Protocol declarations =====

                                        MPMediaPickerControllerDelegate =
                                        interface(IObjectiveC)
                                        ['{A8782A08-86B0-418D-B303-C3EA89A00482}']
                                        procedure mediaPicker
                                        (mediaPicker: MPMediaPickerController;
                                        didPickMediaItems
                                        : MPMediaItemCollection);
                                        cdecl;
                                        procedure mediaPickerDidCancel
                                        (mediaPicker
                                        : MPMediaPickerController); cdecl;
                                        end;

                                        MPMediaPlayback = interface(IObjectiveC)
                                        ['{4599A1CA-CB3C-42E6-B247-602AF8A61235}']
                                        procedure prepareToPlay;
                                        cdecl;
                                        function isPreparedToPlay
                                        : Boolean; cdecl;
                                        procedure play; cdecl;
                                        procedure pause; cdecl;
                                        procedure stop; cdecl;
                                        procedure setCurrentPlaybackTime
                                        (currentPlaybackTime
                                        : NSTimeInterval); cdecl;
                                        function currentPlaybackTime
                                        : NSTimeInterval; cdecl;
                                        procedure setCurrentPlaybackRate
                                        (currentPlaybackRate: Single); cdecl;
                                        function currentPlaybackRate
                                        : Single; cdecl;
                                        procedure beginSeekingForward; cdecl;
                                        procedure beginSeekingBackward; cdecl;
                                        procedure endSeeking; cdecl;
                                        end;

                                        MPPlayableContentDataSource = interface
                                        (IObjectiveC)
                                        ['{594816A7-7984-425E-B423-B4E46F12AB7A}']
                                        procedure beginLoadingChildItemsAtIndexPath
                                        (indexPath: NSIndexPath;
                                        completionHandler
                                        : TMediaPlayerCompletionHandler2);
                                        cdecl;
                                        function childItemsDisplayPlaybackProgressAtIndexPath
                                        (indexPath: NSIndexPath)
                                        : Boolean; cdecl;
                                        function numberOfChildItemsAtIndexPath
                                        (indexPath: NSIndexPath)
                                        : NSInteger; cdecl;
                                        function contentItemAtIndexPath
                                        (indexPath: NSIndexPath)
                                        : MPContentItem; cdecl;
                                        end;

                                        MPPlayableContentDelegate = interface
                                        (IObjectiveC)
                                        ['{EBAF5B13-9D30-4C34-9940-E746340EA857}']
                                        [MethodName
                                        ('playableContentManager:initiatePlaybackOfContentItemAtIndexPath:completionHandler:')
                                        ]
                                        procedure playableContentManagerInitiatePlaybackOfContentItemAtIndexPathCompletionHandler
                                        (contentManager
                                        : MPPlayableContentManager;
                                        initiatePlaybackOfContentItemAtIndexPath
                                        : NSIndexPath;
                                        completionHandler
                                        : TMediaPlayerCompletionHandler2);
                                        cdecl;
                                        [MethodName
                                        ('playableContentManager:initializePlaybackQueueWithCompletionHandler:')
                                        ]
                                        procedure playableContentManagerInitializePlaybackQueueWithCompletionHandler
                                        (contentManager
                                        : MPPlayableContentManager;
                                        initializePlaybackQueueWithCompletionHandler
                                        : TMediaPlayerCompletionHandler2);
                                        cdecl;
                                        [MethodName
                                        ('playableContentManager:didUpdateContext:')
                                        ]
                                        procedure playableContentManagerDidUpdateContext
                                        (contentManager
                                        : MPPlayableContentManager;
                                        didUpdateContext
                                        : MPPlayableContentManagerContext);
                                        cdecl;
                                        end;

                                        // ===== Exported string consts =====

                                        function MPErrorDomain: NSString;
                                        function MPMediaEntityPropertyPersistentID
                                        : NSString;
                                        function MPMediaItemPropertyPersistentID
                                        : NSString;
                                        function MPMediaItemPropertyMediaType
                                        : NSString;
                                        function MPMediaItemPropertyTitle
                                        : NSString;
                                        function MPMediaItemPropertyAlbumTitle
                                        : NSString;
                                        function MPMediaItemPropertyAlbumPersistentID
                                        : NSString;
                                        function MPMediaItemPropertyArtist
                                        : NSString;
                                        function MPMediaItemPropertyArtistPersistentID
                                        : NSString;
                                        function MPMediaItemPropertyAlbumArtist
                                        : NSString;
                                        function MPMediaItemPropertyAlbumArtistPersistentID
                                        : NSString;
                                        function MPMediaItemPropertyGenre
                                        : NSString;
                                        function MPMediaItemPropertyGenrePersistentID
                                        : NSString;
                                        function MPMediaItemPropertyComposer
                                        : NSString;
                                        function MPMediaItemPropertyComposerPersistentID
                                        : NSString;
                                        function MPMediaItemPropertyPlaybackDuration
                                        : NSString;
                                        function MPMediaItemPropertyAlbumTrackNumber
                                        : NSString;
                                        function MPMediaItemPropertyAlbumTrackCount
                                        : NSString;
                                        function MPMediaItemPropertyDiscNumber
                                        : NSString;
                                        function MPMediaItemPropertyDiscCount
                                        : NSString;
                                        function MPMediaItemPropertyArtwork
                                        : NSString;
                                        function MPMediaItemPropertyLyrics
                                        : NSString;
                                        function MPMediaItemPropertyIsCompilation
                                        : NSString;
                                        function MPMediaItemPropertyReleaseDate
                                        : NSString;
                                        function MPMediaItemPropertyBeatsPerMinute
                                        : NSString;
                                        function MPMediaItemPropertyComments
                                        : NSString;
                                        function MPMediaItemPropertyAssetURL
                                        : NSString;
                                        function MPMediaItemPropertyIsCloudItem
                                        : NSString;
                                        function MPMediaItemPropertyHasProtectedAsset
                                        : NSString;
                                        function MPMediaItemPropertyPodcastTitle
                                        : NSString;
                                        function MPMediaItemPropertyPodcastPersistentID
                                        : NSString;
                                        function MPMediaItemPropertyPlayCount
                                        : NSString;
                                        function MPMediaItemPropertySkipCount
                                        : NSString;
                                        function MPMediaItemPropertyRating
                                        : NSString;
                                        function MPMediaItemPropertyLastPlayedDate
                                        : NSString;
                                        function MPMediaItemPropertyUserGrouping
                                        : NSString;
                                        function MPMediaItemPropertyBookmarkTime
                                        : NSString;
                                        function MPMediaLibraryDidChangeNotification
                                        : NSString;
                                        function MPMediaPlaylistPropertyPersistentID
                                        : NSString;
                                        function MPMediaPlaylistPropertyName
                                        : NSString;
                                        function MPMediaPlaylistPropertyPlaylistAttributes
                                        : NSString;
                                        function MPMediaPlaylistPropertySeedItems
                                        : NSString;
                                        function MPMediaPlaylistPropertyDescriptionText
                                        : NSString;
                                        function MPMediaPlaylistPropertyAuthorDisplayName
                                        : NSString;
                                        function MPMediaPlaybackIsPreparedToPlayDidChangeNotification
                                        : NSString;
                                        function MPMoviePlayerScalingModeDidChangeNotification
                                        : NSString;
                                        function MPMoviePlayerPlaybackDidFinishNotification
                                        : NSString;
                                        function MPMoviePlayerPlaybackDidFinishReasonUserInfoKey
                                        : NSString;
                                        function MPMoviePlayerPlaybackStateDidChangeNotification
                                        : NSString;
                                        function MPMoviePlayerLoadStateDidChangeNotification
                                        : NSString;
                                        function MPMoviePlayerNowPlayingMovieDidChangeNotification
                                        : NSString;
                                        function MPMoviePlayerWillEnterFullscreenNotification
                                        : NSString;
                                        function MPMoviePlayerDidEnterFullscreenNotification
                                        : NSString;
                                        function MPMoviePlayerWillExitFullscreenNotification
                                        : NSString;
                                        function MPMoviePlayerDidExitFullscreenNotification
                                        : NSString;
                                        function MPMoviePlayerFullscreenAnimationDurationUserInfoKey
                                        : NSString;
                                        function MPMoviePlayerFullscreenAnimationCurveUserInfoKey
                                        : NSString;
                                        function MPMoviePlayerIsAirPlayVideoActiveDidChangeNotification
                                        : NSString;
                                        function MPMoviePlayerReadyForDisplayDidChangeNotification
                                        : NSString;
                                        function MPMovieMediaTypesAvailableNotification
                                        : NSString;
                                        function MPMovieSourceTypeAvailableNotification
                                        : NSString;
                                        function MPMovieDurationAvailableNotification
                                        : NSString;
                                        function MPMovieNaturalSizeAvailableNotification
                                        : NSString;
                                        function MPMoviePlayerThumbnailImageRequestDidFinishNotification
                                        : NSString;
                                        function MPMoviePlayerThumbnailImageKey
                                        : NSString;
                                        function MPMoviePlayerThumbnailTimeKey
                                        : NSString;
                                        function MPMoviePlayerThumbnailErrorKey
                                        : NSString;
                                        function MPMoviePlayerTimedMetadataUpdatedNotification
                                        : NSString;
                                        function MPMoviePlayerTimedMetadataUserInfoKey
                                        : NSString;
                                        function MPMoviePlayerTimedMetadataKeyName
                                        : NSString;
                                        function MPMoviePlayerTimedMetadataKeyInfo
                                        : NSString;
                                        function MPMoviePlayerTimedMetadataKeyMIMEType
                                        : NSString;
                                        function MPMoviePlayerTimedMetadataKeyDataType
                                        : NSString;
                                        function MPMoviePlayerTimedMetadataKeyLanguageCode
                                        : NSString;
                                        function MPMusicPlayerControllerPlaybackStateDidChangeNotification
                                        : NSString;
                                        function MPMusicPlayerControllerNowPlayingItemDidChangeNotification
                                        : NSString;
                                        function MPMusicPlayerControllerVolumeDidChangeNotification
                                        : NSString;
                                        function MPNowPlayingInfoPropertyElapsedPlaybackTime
                                        : NSString;
                                        function MPNowPlayingInfoPropertyPlaybackRate
                                        : NSString;
                                        function MPNowPlayingInfoPropertyDefaultPlaybackRate
                                        : NSString;
                                        function MPNowPlayingInfoPropertyPlaybackQueueIndex
                                        : NSString;
                                        function MPNowPlayingInfoPropertyPlaybackQueueCount
                                        : NSString;
                                        function MPNowPlayingInfoPropertyChapterNumber
                                        : NSString;
                                        function MPNowPlayingInfoPropertyChapterCount
                                        : NSString;
                                        function MPNowPlayingInfoPropertyAvailableLanguageOptions
                                        : NSString;
                                        function MPNowPlayingInfoPropertyCurrentLanguageOptions
                                        : NSString;
                                        function MPLanguageOptionCharacteristicIsMainProgramContent
                                        : NSString;
                                        function MPLanguageOptionCharacteristicIsAuxiliaryContent
                                        : NSString;
                                        function MPLanguageOptionCharacteristicContainsOnlyForcedSubtitles
                                        : NSString;
                                        function MPLanguageOptionCharacteristicTranscribesSpokenDialog
                                        : NSString;
                                        function MPLanguageOptionCharacteristicDescribesMusicAndSound
                                        : NSString;
                                        function MPLanguageOptionCharacteristicEasyToRead
                                        : NSString;
                                        function MPLanguageOptionCharacteristicDescribesVideo
                                        : NSString;
                                        function MPLanguageOptionCharacteristicLanguageTranslation
                                        : NSString;
                                        function MPLanguageOptionCharacteristicDubbedTranslation
                                        : NSString;
                                        function MPLanguageOptionCharacteristicVoiceOverTranslation
                                        : NSString;
                                        function MPVolumeViewWirelessRoutesAvailableDidChangeNotification
                                        : NSString;
                                        function MPVolumeViewWirelessRouteActiveDidChangeNotification
                                        : NSString;


                                        // ===== External functions =====

                                        const
                                        libMediaPlayer =
                                        '/System/Library/Frameworks/MediaPlayer.framework/MediaPlayer';
                                        procedure MPVolumeSettingsAlertShow;
                                        cdecl; external libMediaPlayer name _PU
                                        + 'MPVolumeSettingsAlertShow';
                                        procedure MPVolumeSettingsAlertHide;
                                        cdecl; external libMediaPlayer name _PU
                                        + 'MPVolumeSettingsAlertHide';
                                        function MPVolumeSettingsAlertIsVisible
                                        : Boolean; cdecl;
                                        external libMediaPlayer name _PU +
                                        'MPVolumeSettingsAlertIsVisible';

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  MediaPlayerModule: THandle;

{$ENDIF IOS}

function MPErrorDomain: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer, 'MPErrorDomain');
end;

function MPMediaEntityPropertyPersistentID: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer,
    'MPMediaEntityPropertyPersistentID');
end;

function MPMediaItemPropertyPersistentID: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer,
    'MPMediaItemPropertyPersistentID');
end;

function MPMediaItemPropertyMediaType: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer, 'MPMediaItemPropertyMediaType');
end;

function MPMediaItemPropertyTitle: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer, 'MPMediaItemPropertyTitle');
end;

function MPMediaItemPropertyAlbumTitle: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer, 'MPMediaItemPropertyAlbumTitle');
end;

function MPMediaItemPropertyAlbumPersistentID: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer,
    'MPMediaItemPropertyAlbumPersistentID');
end;

function MPMediaItemPropertyArtist: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer, 'MPMediaItemPropertyArtist');
end;

function MPMediaItemPropertyArtistPersistentID: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer,
    'MPMediaItemPropertyArtistPersistentID');
end;

function MPMediaItemPropertyAlbumArtist: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer,
    'MPMediaItemPropertyAlbumArtist');
end;

function MPMediaItemPropertyAlbumArtistPersistentID: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer,
    'MPMediaItemPropertyAlbumArtistPersistentID');
end;

function MPMediaItemPropertyGenre: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer, 'MPMediaItemPropertyGenre');
end;

function MPMediaItemPropertyGenrePersistentID: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer,
    'MPMediaItemPropertyGenrePersistentID');
end;

function MPMediaItemPropertyComposer: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer, 'MPMediaItemPropertyComposer');
end;

function MPMediaItemPropertyComposerPersistentID: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer,
    'MPMediaItemPropertyComposerPersistentID');
end;

function MPMediaItemPropertyPlaybackDuration: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer,
    'MPMediaItemPropertyPlaybackDuration');
end;

function MPMediaItemPropertyAlbumTrackNumber: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer,
    'MPMediaItemPropertyAlbumTrackNumber');
end;

function MPMediaItemPropertyAlbumTrackCount: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer,
    'MPMediaItemPropertyAlbumTrackCount');
end;

function MPMediaItemPropertyDiscNumber: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer, 'MPMediaItemPropertyDiscNumber');
end;

function MPMediaItemPropertyDiscCount: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer, 'MPMediaItemPropertyDiscCount');
end;

function MPMediaItemPropertyArtwork: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer, 'MPMediaItemPropertyArtwork');
end;

function MPMediaItemPropertyLyrics: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer, 'MPMediaItemPropertyLyrics');
end;

function MPMediaItemPropertyIsCompilation: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer,
    'MPMediaItemPropertyIsCompilation');
end;

function MPMediaItemPropertyReleaseDate: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer,
    'MPMediaItemPropertyReleaseDate');
end;

function MPMediaItemPropertyBeatsPerMinute: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer,
    'MPMediaItemPropertyBeatsPerMinute');
end;

function MPMediaItemPropertyComments: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer, 'MPMediaItemPropertyComments');
end;

function MPMediaItemPropertyAssetURL: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer, 'MPMediaItemPropertyAssetURL');
end;

function MPMediaItemPropertyIsCloudItem: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer,
    'MPMediaItemPropertyIsCloudItem');
end;

function MPMediaItemPropertyHasProtectedAsset: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer,
    'MPMediaItemPropertyHasProtectedAsset');
end;

function MPMediaItemPropertyPodcastTitle: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer,
    'MPMediaItemPropertyPodcastTitle');
end;

function MPMediaItemPropertyPodcastPersistentID: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer,
    'MPMediaItemPropertyPodcastPersistentID');
end;

function MPMediaItemPropertyPlayCount: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer, 'MPMediaItemPropertyPlayCount');
end;

function MPMediaItemPropertySkipCount: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer, 'MPMediaItemPropertySkipCount');
end;

function MPMediaItemPropertyRating: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer, 'MPMediaItemPropertyRating');
end;

function MPMediaItemPropertyLastPlayedDate: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer,
    'MPMediaItemPropertyLastPlayedDate');
end;

function MPMediaItemPropertyUserGrouping: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer,
    'MPMediaItemPropertyUserGrouping');
end;

function MPMediaItemPropertyBookmarkTime: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer,
    'MPMediaItemPropertyBookmarkTime');
end;

function MPMediaLibraryDidChangeNotification: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer,
    'MPMediaLibraryDidChangeNotification');
end;

function MPMediaPlaylistPropertyPersistentID: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer,
    'MPMediaPlaylistPropertyPersistentID');
end;

function MPMediaPlaylistPropertyName: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer, 'MPMediaPlaylistPropertyName');
end;

function MPMediaPlaylistPropertyPlaylistAttributes: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer,
    'MPMediaPlaylistPropertyPlaylistAttributes');
end;

function MPMediaPlaylistPropertySeedItems: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer,
    'MPMediaPlaylistPropertySeedItems');
end;

function MPMediaPlaylistPropertyDescriptionText: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer,
    'MPMediaPlaylistPropertyDescriptionText');
end;

function MPMediaPlaylistPropertyAuthorDisplayName: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer,
    'MPMediaPlaylistPropertyAuthorDisplayName');
end;

function MPMediaPlaybackIsPreparedToPlayDidChangeNotification: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer,
    'MPMediaPlaybackIsPreparedToPlayDidChangeNotification');
end;

function MPMoviePlayerScalingModeDidChangeNotification: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer,
    'MPMoviePlayerScalingModeDidChangeNotification');
end;

function MPMoviePlayerPlaybackDidFinishNotification: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer,
    'MPMoviePlayerPlaybackDidFinishNotification');
end;

function MPMoviePlayerPlaybackDidFinishReasonUserInfoKey: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer,
    'MPMoviePlayerPlaybackDidFinishReasonUserInfoKey');
end;

function MPMoviePlayerPlaybackStateDidChangeNotification: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer,
    'MPMoviePlayerPlaybackStateDidChangeNotification');
end;

function MPMoviePlayerLoadStateDidChangeNotification: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer,
    'MPMoviePlayerLoadStateDidChangeNotification');
end;

function MPMoviePlayerNowPlayingMovieDidChangeNotification: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer,
    'MPMoviePlayerNowPlayingMovieDidChangeNotification');
end;

function MPMoviePlayerWillEnterFullscreenNotification: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer,
    'MPMoviePlayerWillEnterFullscreenNotification');
end;

function MPMoviePlayerDidEnterFullscreenNotification: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer,
    'MPMoviePlayerDidEnterFullscreenNotification');
end;

function MPMoviePlayerWillExitFullscreenNotification: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer,
    'MPMoviePlayerWillExitFullscreenNotification');
end;

function MPMoviePlayerDidExitFullscreenNotification: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer,
    'MPMoviePlayerDidExitFullscreenNotification');
end;

function MPMoviePlayerFullscreenAnimationDurationUserInfoKey: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer,
    'MPMoviePlayerFullscreenAnimationDurationUserInfoKey');
end;

function MPMoviePlayerFullscreenAnimationCurveUserInfoKey: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer,
    'MPMoviePlayerFullscreenAnimationCurveUserInfoKey');
end;

function MPMoviePlayerIsAirPlayVideoActiveDidChangeNotification: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer,
    'MPMoviePlayerIsAirPlayVideoActiveDidChangeNotification');
end;

function MPMoviePlayerReadyForDisplayDidChangeNotification: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer,
    'MPMoviePlayerReadyForDisplayDidChangeNotification');
end;

function MPMovieMediaTypesAvailableNotification: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer,
    'MPMovieMediaTypesAvailableNotification');
end;

function MPMovieSourceTypeAvailableNotification: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer,
    'MPMovieSourceTypeAvailableNotification');
end;

function MPMovieDurationAvailableNotification: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer,
    'MPMovieDurationAvailableNotification');
end;

function MPMovieNaturalSizeAvailableNotification: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer,
    'MPMovieNaturalSizeAvailableNotification');
end;

function MPMoviePlayerThumbnailImageRequestDidFinishNotification: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer,
    'MPMoviePlayerThumbnailImageRequestDidFinishNotification');
end;

function MPMoviePlayerThumbnailImageKey: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer,
    'MPMoviePlayerThumbnailImageKey');
end;

function MPMoviePlayerThumbnailTimeKey: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer, 'MPMoviePlayerThumbnailTimeKey');
end;

function MPMoviePlayerThumbnailErrorKey: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer,
    'MPMoviePlayerThumbnailErrorKey');
end;

function MPMoviePlayerTimedMetadataUpdatedNotification: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer,
    'MPMoviePlayerTimedMetadataUpdatedNotification');
end;

function MPMoviePlayerTimedMetadataUserInfoKey: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer,
    'MPMoviePlayerTimedMetadataUserInfoKey');
end;

function MPMoviePlayerTimedMetadataKeyName: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer,
    'MPMoviePlayerTimedMetadataKeyName');
end;

function MPMoviePlayerTimedMetadataKeyInfo: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer,
    'MPMoviePlayerTimedMetadataKeyInfo');
end;

function MPMoviePlayerTimedMetadataKeyMIMEType: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer,
    'MPMoviePlayerTimedMetadataKeyMIMEType');
end;

function MPMoviePlayerTimedMetadataKeyDataType: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer,
    'MPMoviePlayerTimedMetadataKeyDataType');
end;

function MPMoviePlayerTimedMetadataKeyLanguageCode: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer,
    'MPMoviePlayerTimedMetadataKeyLanguageCode');
end;

function MPMusicPlayerControllerPlaybackStateDidChangeNotification: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer,
    'MPMusicPlayerControllerPlaybackStateDidChangeNotification');
end;

function MPMusicPlayerControllerNowPlayingItemDidChangeNotification: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer,
    'MPMusicPlayerControllerNowPlayingItemDidChangeNotification');
end;

function MPMusicPlayerControllerVolumeDidChangeNotification: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer,
    'MPMusicPlayerControllerVolumeDidChangeNotification');
end;

function MPNowPlayingInfoPropertyElapsedPlaybackTime: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer,
    'MPNowPlayingInfoPropertyElapsedPlaybackTime');
end;

function MPNowPlayingInfoPropertyPlaybackRate: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer,
    'MPNowPlayingInfoPropertyPlaybackRate');
end;

function MPNowPlayingInfoPropertyDefaultPlaybackRate: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer,
    'MPNowPlayingInfoPropertyDefaultPlaybackRate');
end;

function MPNowPlayingInfoPropertyPlaybackQueueIndex: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer,
    'MPNowPlayingInfoPropertyPlaybackQueueIndex');
end;

function MPNowPlayingInfoPropertyPlaybackQueueCount: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer,
    'MPNowPlayingInfoPropertyPlaybackQueueCount');
end;

function MPNowPlayingInfoPropertyChapterNumber: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer,
    'MPNowPlayingInfoPropertyChapterNumber');
end;

function MPNowPlayingInfoPropertyChapterCount: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer,
    'MPNowPlayingInfoPropertyChapterCount');
end;

function MPNowPlayingInfoPropertyAvailableLanguageOptions: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer,
    'MPNowPlayingInfoPropertyAvailableLanguageOptions');
end;

function MPNowPlayingInfoPropertyCurrentLanguageOptions: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer,
    'MPNowPlayingInfoPropertyCurrentLanguageOptions');
end;

function MPLanguageOptionCharacteristicIsMainProgramContent: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer,
    'MPLanguageOptionCharacteristicIsMainProgramContent');
end;

function MPLanguageOptionCharacteristicIsAuxiliaryContent: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer,
    'MPLanguageOptionCharacteristicIsAuxiliaryContent');
end;

function MPLanguageOptionCharacteristicContainsOnlyForcedSubtitles: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer,
    'MPLanguageOptionCharacteristicContainsOnlyForcedSubtitles');
end;

function MPLanguageOptionCharacteristicTranscribesSpokenDialog: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer,
    'MPLanguageOptionCharacteristicTranscribesSpokenDialog');
end;

function MPLanguageOptionCharacteristicDescribesMusicAndSound: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer,
    'MPLanguageOptionCharacteristicDescribesMusicAndSound');
end;

function MPLanguageOptionCharacteristicEasyToRead: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer,
    'MPLanguageOptionCharacteristicEasyToRead');
end;

function MPLanguageOptionCharacteristicDescribesVideo: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer,
    'MPLanguageOptionCharacteristicDescribesVideo');
end;

function MPLanguageOptionCharacteristicLanguageTranslation: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer,
    'MPLanguageOptionCharacteristicLanguageTranslation');
end;

function MPLanguageOptionCharacteristicDubbedTranslation: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer,
    'MPLanguageOptionCharacteristicDubbedTranslation');
end;

function MPLanguageOptionCharacteristicVoiceOverTranslation: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer,
    'MPLanguageOptionCharacteristicVoiceOverTranslation');
end;

function MPVolumeViewWirelessRoutesAvailableDidChangeNotification: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer,
    'MPVolumeViewWirelessRoutesAvailableDidChangeNotification');
end;

function MPVolumeViewWirelessRouteActiveDidChangeNotification: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer,
    'MPVolumeViewWirelessRouteActiveDidChangeNotification');
end;

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

MediaPlayerModule := dlopen(MarshaledAString(libMediaPlayer), RTLD_LAZY);

finalization

dlclose(MediaPlayerModule);
{$ENDIF IOS}

end.
