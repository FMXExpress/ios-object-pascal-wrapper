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
  Macapi.Mach,
  Macapi.ObjCRuntime,
  Macapi.ObjectiveC,
  iOSapi.AVFoundation,
  iOSapi.CocoaTypes,
  iOSapi.CoreMedia,
  iOSapi.Foundation,
  iOSapi.UIKit;

const
  MPErrorUnknown = 0;
  MPErrorPermissionDenied = 1;
  MPErrorCloudServiceCapabilityMissing = 2;
  MPErrorNetworkConnectionFailed = 3;
  MPErrorNotFound = 4;
  MPErrorNotSupported = 5;
  MPErrorCancelled = 6;
  MPErrorRequestTimedOut = 7;
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
  MPNowPlayingInfoMediaTypeNone = 0;
  MPNowPlayingInfoMediaTypeAudio = 1;
  MPNowPlayingInfoMediaTypeVideo = 2;
  MPNowPlayingPlaybackStateUnknown = 0;
  MPNowPlayingPlaybackStatePlaying = 1;
  MPNowPlayingPlaybackStatePaused = 2;
  MPNowPlayingPlaybackStateStopped = 3;
  MPNowPlayingPlaybackStateInterrupted = 4;
  MPNowPlayingInfoLanguageOptionTypeAudible = 0;
  MPNowPlayingInfoLanguageOptionTypeLegible = 1;
  MPShuffleTypeOff = 0;
  MPShuffleTypeItems = 1;
  MPShuffleTypeCollections = 2;
  MPRepeatTypeOff = 0;
  MPRepeatTypeOne = 1;
  MPRepeatTypeAll = 2;
  MPChangeLanguageOptionSettingNone = 0;
  MPChangeLanguageOptionSettingNowPlayingItemOnly = 1;
  MPChangeLanguageOptionSettingPermanent = 2;
  MPRemoteCommandHandlerStatusSuccess = 0;
  MPRemoteCommandHandlerStatusNoSuchContent = 100;
  MPRemoteCommandHandlerStatusNoActionableNowPlayingItem = 110;
  MPRemoteCommandHandlerStatusDeviceNotFound = 120;
  MPRemoteCommandHandlerStatusCommandFailed = 200;
  MPSeekCommandEventTypeBeginSeeking = 0;
  MPSeekCommandEventTypeEndSeeking = 1;

type

  // ===== Forward declarations =====
{$M+}
  MPNowPlayingInfoLanguageOption = interface;
  MPNowPlayingInfoLanguageOptionGroup = interface;
  MPNowPlayingInfoLanguageOptionAdditions = interface;
  MPAdditions = interface;
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
  MPMusicPlayerQueueDescriptor = interface;
  MPMusicPlayerMediaItemQueueDescriptor = interface;
  MPMusicPlayerStoreQueueDescriptor = interface;
  MPMusicPlayerPlayParameters = interface;
  MPMusicPlayerPlayParametersQueueDescriptor = interface;
  MPMusicPlayerApplicationController = interface;
  MPSystemMusicPlayerController = interface;
  MPMusicPlayerController = interface;
  MPMusicPlayerControllerQueue = interface;
  MPMusicPlayerControllerMutableQueue = interface;
  MPNowPlayingInfoCenter = interface;
  MPRemoteCommandCenter = interface;
  MPNowPlayingSessionDelegate = interface;
  MPAdTimeRange = interface;
  MPNowPlayingSession = interface;
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
  MPChangeShuffleModeCommand = interface;
  MPChangeRepeatModeCommand = interface;
  MPSkipIntervalCommandEvent = interface;
  MPSeekCommandEvent = interface;
  MPRatingCommandEvent = interface;
  MPChangePlaybackRateCommandEvent = interface;
  MPFeedbackCommandEvent = interface;
  MPChangeLanguageOptionCommandEvent = interface;
  MPChangePlaybackPositionCommandEvent = interface;
  MPChangeShuffleModeCommandEvent = interface;
  MPChangeRepeatModeCommandEvent = interface;
  MPVolumeView = interface;
  MediaPlayerAdditions = interface;

  // ===== Framework typedefs =====
{$M+}
  NSInteger = Integer;
  PNSInteger = ^NSInteger;

  MPErrorCode = NSInteger;
  MPMediaEntityPersistentID = UInt64;
  PMPMediaEntityPersistentID = ^MPMediaEntityPersistentID;
  TMediaPlayerUsingBlock = procedure(param1: NSString; param2: Pointer;
    param3: PBoolean) of object;
  NSUInteger = Cardinal;
  PNSUInteger = ^NSUInteger;

  MPMediaType = NSUInteger;
  NSTimeInterval = Double;
  PNSTimeInterval = ^NSTimeInterval;

  CGFloat = Single;
  PCGFloat = ^CGFloat;

  CGSize = record
    width: CGFloat;
    height: CGFloat;
  end;

  PCGSize = ^CGSize;

  TMediaPlayerRequestHandler = function(param1: CGSize): UIImage; cdecl;

  CGPoint = record
    x: CGFloat;
    y: CGFloat;
  end;

  PCGPoint = ^CGPoint;

  CGRect = record
    origin: CGPoint;
    size: CGSize;
  end;

  PCGRect = ^CGRect;

  MPMediaLibraryAuthorizationStatus = NSInteger;
  TMediaPlayerCompletionHandler = procedure
    (param1: MPMediaLibraryAuthorizationStatus) of object;
  TMediaPlayerCompletionHandler1 = procedure(param1: NSArray; param2: NSError)
    of object;
  TMediaPlayerCompletionHandler2 = procedure(param1: MPMediaPlaylist;
    param2: NSError) of object;
  MPMediaPlaylistAttribute = NSUInteger;
  TMediaPlayerCompletionHandler3 = procedure(param1: NSError) of object;
  MPMediaGrouping = NSInteger;
  MPMediaPredicateComparison = NSInteger;

  _NSRange = record
    location: NSUInteger;
    length: NSUInteger;
  end;

  P_NSRange = ^_NSRange;
  NSRange = _NSRange;
  PNSRange = ^NSRange;

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
  PNSStringEncoding = ^NSStringEncoding;
  MPMusicPlaybackState = NSInteger;
  MPMusicRepeatMode = NSInteger;
  MPMusicShuffleMode = NSInteger;
  NSNotificationName = NSString;
  PNSNotificationName = ^NSNotificationName;
  TMediaPlayerQueueTransaction = procedure
    (param1: MPMusicPlayerControllerMutableQueue) of object;
  TMediaPlayerCompletionHandler4 = procedure
    (param1: MPMusicPlayerControllerQueue; param2: NSError) of object;
  MPNowPlayingInfoMediaType = NSUInteger;
  MPNowPlayingPlaybackState = NSUInteger;
  MPNowPlayingInfoLanguageOptionType = NSUInteger;
  CMTimeValue = Int64;
  PCMTimeValue = ^CMTimeValue;
  CMTimeScale = Int32;
  PCMTimeScale = ^CMTimeScale;
  CMTimeFlags = LongWord;
  CMTimeEpoch = Int64;
  PCMTimeEpoch = ^CMTimeEpoch;

  CMTime = record
    value: CMTimeValue;
    timescale: CMTimeScale;
    flags: CMTimeFlags;
    epoch: CMTimeEpoch;
  end;

  PCMTime = ^CMTime;

  CMTimeRange = record
    start: CMTime;
    duration: CMTime;
  end;

  PCMTimeRange = ^CMTimeRange;

  TMediaPlayerCompletion = procedure(param1: Boolean) of object;
  TMediaPlayerCompletionHandler5 = procedure(param1: MPContentItem;
    param2: NSError) of object;
  MPShuffleType = NSInteger;
  MPRepeatType = NSInteger;
  MPChangeLanguageOptionSetting = NSInteger;
  MPRemoteCommandHandlerStatus = NSInteger;
  SEL = SEL *;
  PSEL = ^SEL;
  TMediaPlayerHandler = function(param1: MPRemoteCommandEvent)
    : MPRemoteCommandHandlerStatus; cdecl;
  MPSeekCommandEventType = NSUInteger;
  UIControlState = NSUInteger;
  // ===== Interface declarations =====

  MPNowPlayingInfoLanguageOptionClass = interface(NSObjectClass)
    ['{EFB4F91F-1E98-40B0-A4ED-C51D2BCDD5F2}']
  end;

  MPNowPlayingInfoLanguageOption = interface(NSObject)
    ['{C135304A-09B2-4710-972C-56FF86A9FEA1}']
    function initWithType(languageOptionType
      : MPNowPlayingInfoLanguageOptionType; languageTag: NSString;
      characteristics: NSArray; displayName: NSString; identifier: NSString)
      : Pointer { instancetype }; cdecl;
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
    ['{B5E3DA29-4B4E-4977-88E3-9F4482EAA81C}']
  end;

  MPNowPlayingInfoLanguageOptionGroup = interface(NSObject)
    ['{2FAADAA0-AB79-46D0-B2F9-C10E486A56F1}']
    function initWithLanguageOptions(languageOptions: NSArray;
      defaultLanguageOption: MPNowPlayingInfoLanguageOption;
      allowEmptySelection: Boolean): Pointer { instancetype }; cdecl;
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
    ['{0BB0C948-7F24-43EE-AAAE-5BB6925E82C7}']
    function makeNowPlayingInfoLanguageOption
      : MPNowPlayingInfoLanguageOption; cdecl;
    function makeNowPlayingInfoLanguageOptionGroup
      : MPNowPlayingInfoLanguageOptionGroup; cdecl;
  end;

  MPAdditions = interface(IObjectiveC)
    ['{4A6174E1-179C-4327-8612-A1564222E208}']
    procedure setNowPlayingInfo(nowPlayingInfo: NSDictionary); cdecl;
    function nowPlayingInfo: NSDictionary; cdecl;
  end;

  MPMediaItemArtworkClass = interface(NSObjectClass)
    ['{83154775-3382-4CE0-9030-67F442933C06}']
  end;

  MPMediaItemArtwork = interface(NSObject)
    ['{74C5CD2C-9C9A-481C-9894-77090440BFAD}']
    function initWithBoundsSize(boundsSize: CGSize;
      requestHandler: TMediaPlayerRequestHandler)
      : Pointer { instancetype }; cdecl;
    function imageWithSize(size: CGSize): UIImage; cdecl;
    function bounds: CGRect; cdecl;
    function imageCropRect: CGRect; cdecl;
    function initWithImage(image: UIImage): Pointer { instancetype }; cdecl;
  end;

  TMPMediaItemArtwork = class(TOCGenericImport<MPMediaItemArtworkClass,
    MPMediaItemArtwork>)
  end;

  PMPMediaItemArtwork = Pointer;

  MPContentItemClass = interface(NSObjectClass)
    ['{696ED7C1-2540-4BA9-94BF-76441CB70BE5}']
  end;

  MPContentItem = interface(NSObject)
    ['{5094F944-9A66-423A-AEFD-3DF6B381A87E}']
    function initWithIdentifier(identifier: NSString)
      : Pointer { instancetype }; cdecl;
    function identifier: NSString; cdecl;
    procedure setTitle(title: NSString); cdecl;
    function title: NSString; cdecl;
    procedure setSubtitle(subtitle: NSString); cdecl;
    function subtitle: NSString; cdecl;
    procedure setArtwork(artwork: MPMediaItemArtwork); cdecl;
    function artwork: MPMediaItemArtwork; cdecl;
    procedure setPlaybackProgress(playbackProgress: Single); cdecl;
    function playbackProgress: Single; cdecl;
    procedure setStreamingContent(streamingContent: Boolean); cdecl;
    function isStreamingContent: Boolean; cdecl;
    procedure setExplicitContent(explicitContent: Boolean); cdecl;
    function isExplicitContent: Boolean; cdecl;
    procedure setContainer(container: Boolean); cdecl;
    function isContainer: Boolean; cdecl;
    procedure setPlayable(playable: Boolean); cdecl;
    function isPlayable: Boolean; cdecl;
  end;

  TMPContentItem = class(TOCGenericImport<MPContentItemClass, MPContentItem>)
  end;

  PMPContentItem = Pointer;

  MPMediaLibraryClass = interface(NSObjectClass)
    ['{13970944-7CFF-454A-9509-1DDB0560FA60}']
    { class } function defaultMediaLibrary: MPMediaLibrary; cdecl;
    { class } function authorizationStatus
      : MPMediaLibraryAuthorizationStatus; cdecl;
    { class } procedure requestAuthorization(completionHandler
      : TMediaPlayerCompletionHandler); cdecl;
  end;

  MPMediaLibrary = interface(NSObject)
    ['{99A97A57-042A-40CD-8FE7-E23ADC5F6FFF}']
    function lastModifiedDate: NSDate; cdecl;
    procedure beginGeneratingLibraryChangeNotifications; cdecl;
    procedure endGeneratingLibraryChangeNotifications; cdecl;
    procedure addItemWithProductID(productID: NSString;
      completionHandler: TMediaPlayerCompletionHandler1); cdecl;
    procedure getPlaylistWithUUID(uuid: NSUUID;
      creationMetadata: MPMediaPlaylistCreationMetadata;
      completionHandler: TMediaPlayerCompletionHandler2); cdecl;
  end;

  TMPMediaLibrary = class(TOCGenericImport<MPMediaLibraryClass, MPMediaLibrary>)
  end;

  PMPMediaLibrary = Pointer;

  MPMediaEntityClass = interface(NSObjectClass)
    ['{D79363D9-7DF1-4E6C-A52C-011DF13C6FE7}']
    { class } function canFilterByProperty(&property: NSString): Boolean; cdecl;
  end;

  MPMediaEntity = interface(NSObject)
    ['{71AA525E-A047-4A74-9C51-56FCD29E97DA}']
    procedure enumerateValuesForProperties(properties: NSSet;
      usingBlock: TMediaPlayerUsingBlock); cdecl;
    function objectForKeyedSubscript(key: Pointer): Pointer; cdecl;
    function valueForProperty(&property: NSString): Pointer; cdecl;
    function persistentID: MPMediaEntityPersistentID; cdecl;
  end;

  TMPMediaEntity = class(TOCGenericImport<MPMediaEntityClass, MPMediaEntity>)
  end;

  PMPMediaEntity = Pointer;

  MPMediaItemClass = interface(MPMediaEntityClass)
    ['{C60ADF62-1F2F-4B0A-B08E-A7A38187DF60}']
    { class } function persistentIDPropertyForGroupingType
      (groupingType: MPMediaGrouping): NSString; cdecl;
    { class } function titlePropertyForGroupingType(groupingType
      : MPMediaGrouping): NSString; cdecl;
  end;

  MPMediaItem = interface(MPMediaEntity)
    ['{DBF2144C-B42B-4002-9E88-5CBE1A6AD6AD}']
    function persistentID: MPMediaEntityPersistentID; cdecl;
    function mediaType: MPMediaType; cdecl;
    function title: NSString; cdecl;
    function albumTitle: NSString; cdecl;
    function albumPersistentID: MPMediaEntityPersistentID; cdecl;
    function artist: NSString; cdecl;
    function artistPersistentID: MPMediaEntityPersistentID; cdecl;
    function albumArtist: NSString; cdecl;
    function albumArtistPersistentID: MPMediaEntityPersistentID; cdecl;
    function genre: NSString; cdecl;
    function genrePersistentID: MPMediaEntityPersistentID; cdecl;
    function composer: NSString; cdecl;
    function composerPersistentID: MPMediaEntityPersistentID; cdecl;
    function playbackDuration: NSTimeInterval; cdecl;
    function albumTrackNumber: NSUInteger; cdecl;
    function albumTrackCount: NSUInteger; cdecl;
    function discNumber: NSUInteger; cdecl;
    function discCount: NSUInteger; cdecl;
    function artwork: MPMediaItemArtwork; cdecl;
    function isExplicitItem: Boolean; cdecl;
    function lyrics: NSString; cdecl;
    function isCompilation: Boolean; cdecl;
    function releaseDate: NSDate; cdecl;
    function beatsPerMinute: NSUInteger; cdecl;
    function comments: NSString; cdecl;
    function assetURL: NSURL; cdecl;
    function isCloudItem: Boolean; cdecl;
    function hasProtectedAsset: Boolean; cdecl;
    function podcastTitle: NSString; cdecl;
    function podcastPersistentID: MPMediaEntityPersistentID; cdecl;
    function playCount: NSUInteger; cdecl;
    function skipCount: NSUInteger; cdecl;
    function rating: NSUInteger; cdecl;
    function lastPlayedDate: NSDate; cdecl;
    function userGrouping: NSString; cdecl;
    function bookmarkTime: NSTimeInterval; cdecl;
    function dateAdded: NSDate; cdecl;
    function playbackStoreID: NSString; cdecl;
    function isPreorder: Boolean; cdecl;
  end;

  TMPMediaItem = class(TOCGenericImport<MPMediaItemClass, MPMediaItem>)
  end;

  PMPMediaItem = Pointer;

  MPMediaItemCollectionClass = interface(MPMediaEntityClass)
    ['{EB98BA9C-9E66-4B26-905D-38E62C358D58}']
    { class } function collectionWithItems(items: NSArray)
      : MPMediaItemCollection; cdecl;
  end;

  MPMediaItemCollection = interface(MPMediaEntity)
    ['{0ECA4BB0-6073-4168-AC10-B5E5A4CD2396}']
    function initWithItems(items: NSArray): Pointer { instancetype }; cdecl;
    function items: NSArray; cdecl;
    function representativeItem: MPMediaItem; cdecl;
    function count: NSUInteger; cdecl;
    function mediaTypes: MPMediaType; cdecl;
  end;

  TMPMediaItemCollection = class(TOCGenericImport<MPMediaItemCollectionClass,
    MPMediaItemCollection>)
  end;

  PMPMediaItemCollection = Pointer;

  MPMediaQueryClass = interface(NSObjectClass)
    ['{033C9782-638E-4A16-94B3-11FB6F72827C}']
    { class } function albumsQuery: MPMediaQuery; cdecl;
    { class } function artistsQuery: MPMediaQuery; cdecl;
    { class } function songsQuery: MPMediaQuery; cdecl;
    { class } function playlistsQuery: MPMediaQuery; cdecl;
    { class } function podcastsQuery: MPMediaQuery; cdecl;
    { class } function audiobooksQuery: MPMediaQuery; cdecl;
    { class } function compilationsQuery: MPMediaQuery; cdecl;
    { class } function composersQuery: MPMediaQuery; cdecl;
    { class } function genresQuery: MPMediaQuery; cdecl;
  end;

  MPMediaQuery = interface(NSObject)
    ['{09C17F77-68DB-4FE2-968F-685C4C397518}']
    function initWithFilterPredicates(filterPredicates: NSSet)
      : Pointer { instancetype }; cdecl;
    procedure setFilterPredicates(filterPredicates: NSSet); cdecl;
    function filterPredicates: NSSet; cdecl;
    procedure addFilterPredicate(predicate: MPMediaPredicate); cdecl;
    procedure removeFilterPredicate(predicate: MPMediaPredicate); cdecl;
    function items: NSArray; cdecl;
    function collections: NSArray; cdecl;
    procedure setGroupingType(groupingType: MPMediaGrouping); cdecl;
    function groupingType: MPMediaGrouping; cdecl;
    function itemSections: NSArray; cdecl;
    function collectionSections: NSArray; cdecl;
  end;

  TMPMediaQuery = class(TOCGenericImport<MPMediaQueryClass, MPMediaQuery>)
  end;

  PMPMediaQuery = Pointer;

  MPMediaPlaylistClass = interface(MPMediaItemCollectionClass)
    ['{2C6F5C51-5853-4F5D-AC3F-4A30A4199967}']
  end;

  MPMediaPlaylist = interface(MPMediaItemCollection)
    ['{CF76B90E-F69C-4E5C-BF8D-D4253DC4377A}']
    function persistentID: MPMediaEntityPersistentID; cdecl;
    function cloudGlobalID: NSString; cdecl;
    function name: NSString; cdecl;
    function playlistAttributes: MPMediaPlaylistAttribute; cdecl;
    function seedItems: NSArray; cdecl;
    function descriptionText: NSString; cdecl;
    function authorDisplayName: NSString; cdecl;
    procedure addItemWithProductID(productID: NSString;
      completionHandler: TMediaPlayerCompletionHandler3); cdecl;
    procedure addMediaItems(mediaItems: NSArray;
      completionHandler: TMediaPlayerCompletionHandler3); cdecl;
  end;

  TMPMediaPlaylist = class(TOCGenericImport<MPMediaPlaylistClass,
    MPMediaPlaylist>)
  end;

  PMPMediaPlaylist = Pointer;

  MPMediaPlaylistCreationMetadataClass = interface(NSObjectClass)
    ['{1E133A4B-D698-4157-B516-C49EEA07CFB0}']
  end;

  MPMediaPlaylistCreationMetadata = interface(NSObject)
    ['{30E41670-46EE-47F7-9490-87C1DAAEF2F3}']
    function initWithName(name: NSString): Pointer { instancetype }; cdecl;
    function name: NSString; cdecl;
    procedure setAuthorDisplayName(authorDisplayName: NSString); cdecl;
    function authorDisplayName: NSString; cdecl;
    procedure setDescriptionText(descriptionText: NSString); cdecl;
    function descriptionText: NSString; cdecl;
  end;

  TMPMediaPlaylistCreationMetadata = class
    (TOCGenericImport<MPMediaPlaylistCreationMetadataClass,
    MPMediaPlaylistCreationMetadata>)
  end;

  PMPMediaPlaylistCreationMetadata = Pointer;

  MPMediaPickerControllerClass = interface(UIViewControllerClass)
    ['{5AB01C5B-2D2C-4491-A9A8-BC57E349FCD5}']
  end;

  MPMediaPickerController = interface(UIViewController)
    ['{FAB962A2-BCC6-40AA-8C04-AA929EE3BCA6}']
    function initWithMediaTypes(mediaTypes: MPMediaType)
      : Pointer { instancetype }; cdecl;
    function mediaTypes: MPMediaType; cdecl;
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    procedure setAllowsPickingMultipleItems(allowsPickingMultipleItems
      : Boolean); cdecl;
    function allowsPickingMultipleItems: Boolean; cdecl;
    procedure setShowsCloudItems(showsCloudItems: Boolean); cdecl;
    function showsCloudItems: Boolean; cdecl;
    procedure setShowsItemsWithProtectedAssets(showsItemsWithProtectedAssets
      : Boolean); cdecl;
    function showsItemsWithProtectedAssets: Boolean; cdecl;
    procedure setPrompt(prompt: NSString); cdecl;
    function prompt: NSString; cdecl;
  end;

  TMPMediaPickerController = class
    (TOCGenericImport<MPMediaPickerControllerClass, MPMediaPickerController>)
  end;

  PMPMediaPickerController = Pointer;

  MPMediaPredicateClass = interface(NSObjectClass)
    ['{90E52192-E78E-461D-9DC3-8E2ADDD9F139}']
  end;

  MPMediaPredicate = interface(NSObject)
    ['{8A95451D-2DAA-408B-B2D3-29ED185F3157}']
  end;

  TMPMediaPredicate = class(TOCGenericImport<MPMediaPredicateClass,
    MPMediaPredicate>)
  end;

  PMPMediaPredicate = Pointer;

  MPMediaQuerySectionClass = interface(NSObjectClass)
    ['{0B78805F-937D-4F93-9F1F-497A64DC59AF}']
  end;

  MPMediaQuerySection = interface(NSObject)
    ['{22367847-41F8-4183-964A-3E7E96D32A55}']
    function title: NSString; cdecl;
    function range: NSRange; cdecl;
  end;

  TMPMediaQuerySection = class(TOCGenericImport<MPMediaQuerySectionClass,
    MPMediaQuerySection>)
  end;

  PMPMediaQuerySection = Pointer;

  MPMediaPropertyPredicateClass = interface(MPMediaPredicateClass)
    ['{6D07EBAB-1CA7-4144-B5C3-70F98AB0E9AC}']
    [MethodName('predicateWithValue:forProperty:')]
    { class } function predicateWithValueForProperty(value: Pointer;
      forProperty: NSString): MPMediaPropertyPredicate; cdecl;
    [MethodName('predicateWithValue:forProperty:comparisonType:')]
    { class } function predicateWithValueForPropertyComparisonType
      (value: Pointer; forProperty: NSString;
      comparisonType: MPMediaPredicateComparison)
      : MPMediaPropertyPredicate; cdecl;
  end;

  MPMediaPropertyPredicate = interface(MPMediaPredicate)
    ['{98E546D8-D298-4CC7-8462-C3CCAA8068B2}']
    function &property: NSString; cdecl;
    function value: Pointer; cdecl;
    function comparisonType: MPMediaPredicateComparison; cdecl;
  end;

  TMPMediaPropertyPredicate = class
    (TOCGenericImport<MPMediaPropertyPredicateClass, MPMediaPropertyPredicate>)
  end;

  PMPMediaPropertyPredicate = Pointer;

  MPMovieAccessLogClass = interface(NSObjectClass)
    ['{BAF21107-3333-4305-ADE1-9C79FEF92640}']
  end;

  MPMovieAccessLog = interface(NSObject)
    ['{610624D4-D373-48EF-923B-357980A3C85D}']
    function extendedLogData: NSData; cdecl;
    function extendedLogDataStringEncoding: NSStringEncoding; cdecl;
    function events: NSArray; cdecl;
  end;

  TMPMovieAccessLog = class(TOCGenericImport<MPMovieAccessLogClass,
    MPMovieAccessLog>)
  end;

  PMPMovieAccessLog = Pointer;

  MPMovieErrorLogClass = interface(NSObjectClass)
    ['{483F6105-3B51-4430-93BB-92CD27AE6293}']
  end;

  MPMovieErrorLog = interface(NSObject)
    ['{535CB72A-BF7D-44E9-A265-2A562E22F5A3}']
    function extendedLogData: NSData; cdecl;
    function extendedLogDataStringEncoding: NSStringEncoding; cdecl;
    function events: NSArray; cdecl;
  end;

  TMPMovieErrorLog = class(TOCGenericImport<MPMovieErrorLogClass,
    MPMovieErrorLog>)
  end;

  PMPMovieErrorLog = Pointer;

  MPMoviePlayerControllerClass = interface(NSObjectClass)
    ['{73BCBFC0-D8BE-4BA1-A873-C0D786E5DF00}']
  end;

  MPMoviePlayerController = interface(NSObject)
    ['{AF5764E0-3B8D-43E1-A55F-C20D50AE3D2A}']
    function initWithContentURL(url: NSURL): Pointer { instancetype }; cdecl;
    procedure setContentURL(contentURL: NSURL); cdecl;
    function contentURL: NSURL; cdecl;
    function view: UIView; cdecl;
    function backgroundView: UIView; cdecl;
    function playbackState: MPMoviePlaybackState; cdecl;
    function loadState: MPMovieLoadState; cdecl;
    procedure setControlStyle(controlStyle: MPMovieControlStyle); cdecl;
    function controlStyle: MPMovieControlStyle; cdecl;
    procedure setRepeatMode(repeatMode: MPMovieRepeatMode); cdecl;
    function repeatMode: MPMovieRepeatMode; cdecl;
    procedure setShouldAutoplay(shouldAutoplay: Boolean); cdecl;
    function shouldAutoplay: Boolean; cdecl;
    [MethodName('setFullscreen:')]
    procedure setFullscreen(fullscreen: Boolean); cdecl;
    function isFullscreen: Boolean; cdecl;
    [MethodName('setFullscreen:animated:')]
    procedure setFullscreenAnimated(fullscreen: Boolean;
      animated: Boolean); cdecl;
    procedure setScalingMode(scalingMode: MPMovieScalingMode); cdecl;
    function scalingMode: MPMovieScalingMode; cdecl;
    function readyForDisplay: Boolean; cdecl;
    function movieMediaTypes: MPMovieMediaTypeMask; cdecl;
    procedure setMovieSourceType(movieSourceType: MPMovieSourceType); cdecl;
    function movieSourceType: MPMovieSourceType; cdecl;
    function duration: NSTimeInterval; cdecl;
    function playableDuration: NSTimeInterval; cdecl;
    function naturalSize: CGSize; cdecl;
    procedure setInitialPlaybackTime(initialPlaybackTime
      : NSTimeInterval); cdecl;
    function initialPlaybackTime: NSTimeInterval; cdecl;
    procedure setEndPlaybackTime(endPlaybackTime: NSTimeInterval); cdecl;
    function endPlaybackTime: NSTimeInterval; cdecl;
    procedure setAllowsAirPlay(allowsAirPlay: Boolean); cdecl;
    function allowsAirPlay: Boolean; cdecl;
    function isAirPlayVideoActive: Boolean; cdecl;
    function thumbnailImageAtTime(playbackTime: NSTimeInterval;
      timeOption: MPMovieTimeOption): UIImage; cdecl;
    procedure requestThumbnailImagesAtTimes(playbackTimes: NSArray;
      timeOption: MPMovieTimeOption); cdecl;
    procedure cancelAllThumbnailImageRequests; cdecl;
    function timedMetadata: NSArray; cdecl;
    function accessLog: MPMovieAccessLog; cdecl;
    function errorLog: MPMovieErrorLog; cdecl;
    procedure setUseApplicationAudioSession(useApplicationAudioSession
      : Boolean); cdecl;
    function useApplicationAudioSession: Boolean; cdecl;
  end;

  TMPMoviePlayerController = class
    (TOCGenericImport<MPMoviePlayerControllerClass, MPMoviePlayerController>)
  end;

  PMPMoviePlayerController = Pointer;

  MPTimedMetadataClass = interface(NSObjectClass)
    ['{FC3CCE7D-734A-4161-A70B-4340112EFF4F}']
  end;

  MPTimedMetadata = interface(NSObject)
    ['{71C2A40B-5E0D-4DC4-817D-55A39298C78C}']
    function key: NSString; cdecl;
    function keyspace: NSString; cdecl;
    function value: Pointer; cdecl;
    function timestamp: NSTimeInterval; cdecl;
    function allMetadata: NSDictionary; cdecl;
  end;

  TMPTimedMetadata = class(TOCGenericImport<MPTimedMetadataClass,
    MPTimedMetadata>)
  end;

  PMPTimedMetadata = Pointer;

  MPMovieAccessLogEventClass = interface(NSObjectClass)
    ['{B92EC703-A221-4C40-B0E5-6A1D7CBFF320}']
  end;

  MPMovieAccessLogEvent = interface(NSObject)
    ['{4D5827C7-AB41-4333-BBE4-1FAAB5823A11}']
    function numberOfSegmentsDownloaded: NSUInteger; cdecl;
    function playbackStartDate: NSDate; cdecl;
    function URI: NSString; cdecl;
    function serverAddress: NSString; cdecl;
    function numberOfServerAddressChanges: NSUInteger; cdecl;
    function playbackSessionID: NSString; cdecl;
    function playbackStartOffset: NSTimeInterval; cdecl;
    function segmentsDownloadedDuration: NSTimeInterval; cdecl;
    function durationWatched: NSTimeInterval; cdecl;
    function numberOfStalls: NSInteger; cdecl;
    function numberOfBytesTransferred: Int64; cdecl;
    function observedBitrate: Double; cdecl;
    function indicatedBitrate: Double; cdecl;
    function numberOfDroppedVideoFrames: NSInteger; cdecl;
  end;

  TMPMovieAccessLogEvent = class(TOCGenericImport<MPMovieAccessLogEventClass,
    MPMovieAccessLogEvent>)
  end;

  PMPMovieAccessLogEvent = Pointer;

  MPMovieErrorLogEventClass = interface(NSObjectClass)
    ['{11A1C102-32C2-4CC5-9E7A-72E04ABDF2C6}']
  end;

  MPMovieErrorLogEvent = interface(NSObject)
    ['{DC67E370-85BA-439F-8E1B-D3D9CF9882F7}']
    function date: NSDate; cdecl;
    function URI: NSString; cdecl;
    function serverAddress: NSString; cdecl;
    function playbackSessionID: NSString; cdecl;
    function errorStatusCode: NSInteger; cdecl;
    function errorDomain: NSString; cdecl;
    function errorComment: NSString; cdecl;
  end;

  TMPMovieErrorLogEvent = class(TOCGenericImport<MPMovieErrorLogEventClass,
    MPMovieErrorLogEvent>)
  end;

  PMPMovieErrorLogEvent = Pointer;

  MPMoviePlayerViewControllerClass = interface(UIViewControllerClass)
    ['{CF444692-AD42-4DC2-A82C-FC0A0D4FADE4}']
  end;

  MPMoviePlayerViewController = interface(UIViewController)
    ['{2D26B49E-AC20-48EC-BEA0-205F020E1F15}']
    function initWithContentURL(contentURL: NSURL)
      : Pointer { instancetype }; cdecl;
    function moviePlayer: MPMoviePlayerController; cdecl;
    procedure presentMoviePlayerViewControllerAnimated(moviePlayerViewController
      : MPMoviePlayerViewController); cdecl;
    procedure dismissMoviePlayerViewControllerAnimated; cdecl;
  end;

  TMPMoviePlayerViewController = class
    (TOCGenericImport<MPMoviePlayerViewControllerClass,
    MPMoviePlayerViewController>)
  end;

  PMPMoviePlayerViewController = Pointer;

  MPMusicPlayerQueueDescriptorClass = interface(NSObjectClass)
    ['{47FF69B5-2BAF-4C17-A97C-CB0010A90DF5}']
  end;

  MPMusicPlayerQueueDescriptor = interface(NSObject)
    ['{F9792C04-3FFA-4FC2-B1C3-B6943CD13E14}']
  end;

  TMPMusicPlayerQueueDescriptor = class
    (TOCGenericImport<MPMusicPlayerQueueDescriptorClass,
    MPMusicPlayerQueueDescriptor>)
  end;

  PMPMusicPlayerQueueDescriptor = Pointer;

  MPMusicPlayerMediaItemQueueDescriptorClass = interface
    (MPMusicPlayerQueueDescriptorClass)
    ['{57915232-3753-4244-BF70-B8CED9B5E521}']
  end;

  MPMusicPlayerMediaItemQueueDescriptor = interface
    (MPMusicPlayerQueueDescriptor)
    ['{46701DF9-EFF7-4598-9F43-36161B9F80D0}']
    function initWithQuery(query: MPMediaQuery)
      : Pointer { instancetype }; cdecl;
    function initWithItemCollection(itemCollection: MPMediaItemCollection)
      : Pointer { instancetype }; cdecl;
    function query: MPMediaQuery; cdecl;
    function itemCollection: MPMediaItemCollection; cdecl;
    procedure setStartItem(startItem: MPMediaItem); cdecl;
    function startItem: MPMediaItem; cdecl;
    procedure setStartTime(startTime: NSTimeInterval;
      forItem: MPMediaItem); cdecl;
    procedure setEndTime(endTime: NSTimeInterval; forItem: MPMediaItem); cdecl;
  end;

  TMPMusicPlayerMediaItemQueueDescriptor = class
    (TOCGenericImport<MPMusicPlayerMediaItemQueueDescriptorClass,
    MPMusicPlayerMediaItemQueueDescriptor>)
  end;

  PMPMusicPlayerMediaItemQueueDescriptor = Pointer;

  MPMusicPlayerStoreQueueDescriptorClass = interface
    (MPMusicPlayerQueueDescriptorClass)
    ['{41C5FF0C-A9A0-487C-837C-B735A15CAB1A}']
  end;

  MPMusicPlayerStoreQueueDescriptor = interface(MPMusicPlayerQueueDescriptor)
    ['{99DC863F-71FB-4B5B-BF75-50A458CAB503}']
    function initWithStoreIDs(storeIDs: NSArray)
      : Pointer { instancetype }; cdecl;
    procedure setStoreIDs(storeIDs: NSArray); cdecl;
    function storeIDs: NSArray; cdecl;
    procedure setStartItemID(startItemID: NSString); cdecl;
    function startItemID: NSString; cdecl;
    procedure setStartTime(startTime: NSTimeInterval;
      forItemWithStoreID: NSString); cdecl;
    procedure setEndTime(endTime: NSTimeInterval;
      forItemWithStoreID: NSString); cdecl;
  end;

  TMPMusicPlayerStoreQueueDescriptor = class
    (TOCGenericImport<MPMusicPlayerStoreQueueDescriptorClass,
    MPMusicPlayerStoreQueueDescriptor>)
  end;

  PMPMusicPlayerStoreQueueDescriptor = Pointer;

  MPMusicPlayerPlayParametersClass = interface(NSObjectClass)
    ['{460568AF-E811-46A0-8764-779AA7396C5D}']
  end;

  MPMusicPlayerPlayParameters = interface(NSObject)
    ['{07AD90FD-DB51-4839-A176-8A29768D8EA8}']
    function initWithDictionary(dictionary: NSDictionary)
      : Pointer { instancetype }; cdecl;
    function dictionary: NSDictionary; cdecl;
  end;

  TMPMusicPlayerPlayParameters = class
    (TOCGenericImport<MPMusicPlayerPlayParametersClass,
    MPMusicPlayerPlayParameters>)
  end;

  PMPMusicPlayerPlayParameters = Pointer;

  MPMusicPlayerPlayParametersQueueDescriptorClass = interface
    (MPMusicPlayerQueueDescriptorClass)
    ['{D7B6016E-F7DE-4660-AC0F-607961BCACBF}']
  end;

  MPMusicPlayerPlayParametersQueueDescriptor = interface
    (MPMusicPlayerQueueDescriptor)
    ['{17EC87C7-ECEE-4571-B5EA-08619249338A}']
    function initWithPlayParametersQueue(playParametersQueue: NSArray)
      : Pointer { instancetype }; cdecl;
    procedure setPlayParametersQueue(playParametersQueue: NSArray); cdecl;
    function playParametersQueue: NSArray; cdecl;
    procedure setStartItemPlayParameters(startItemPlayParameters
      : MPMusicPlayerPlayParameters); cdecl;
    function startItemPlayParameters: MPMusicPlayerPlayParameters; cdecl;
    procedure setStartTime(startTime: NSTimeInterval;
      forItemWithPlayParameters: MPMusicPlayerPlayParameters); cdecl;
    procedure setEndTime(endTime: NSTimeInterval;
      forItemWithPlayParameters: MPMusicPlayerPlayParameters); cdecl;
  end;

  TMPMusicPlayerPlayParametersQueueDescriptor = class
    (TOCGenericImport<MPMusicPlayerPlayParametersQueueDescriptorClass,
    MPMusicPlayerPlayParametersQueueDescriptor>)
  end;

  PMPMusicPlayerPlayParametersQueueDescriptor = Pointer;

  MPMusicPlayerControllerClass = interface(NSObjectClass)
    ['{AEBDE4CF-1D00-42AC-B3F2-20D9CE28604F}']
  end;

  MPMusicPlayerController = interface(NSObject)
    ['{4023595B-5861-46FC-BD1B-08DFE5ABE524}']
    procedure setApplicationMusicPlayer(applicationMusicPlayer
      : MPMusicPlayerController); cdecl;
    function applicationMusicPlayer: MPMusicPlayerController; cdecl;
    procedure setApplicationQueuePlayer(applicationQueuePlayer
      : MPMusicPlayerApplicationController); cdecl;
    function applicationQueuePlayer: MPMusicPlayerApplicationController; cdecl;
    procedure setSystemMusicPlayer(systemMusicPlayer
      : MPMusicPlayerController); cdecl;
    function systemMusicPlayer: MPMusicPlayerController; cdecl;
    function playbackState: MPMusicPlaybackState; cdecl;
    procedure setRepeatMode(repeatMode: MPMusicRepeatMode); cdecl;
    function repeatMode: MPMusicRepeatMode; cdecl;
    procedure setShuffleMode(shuffleMode: MPMusicShuffleMode); cdecl;
    function shuffleMode: MPMusicShuffleMode; cdecl;
    procedure setVolume(volume: Single); cdecl;
    function volume: Single; cdecl;
    procedure setNowPlayingItem(nowPlayingItem: MPMediaItem); cdecl;
    function nowPlayingItem: MPMediaItem; cdecl;
    function indexOfNowPlayingItem: NSUInteger; cdecl;
    procedure setQueueWithQuery(query: MPMediaQuery); cdecl;
    procedure setQueueWithItemCollection(itemCollection
      : MPMediaItemCollection); cdecl;
    procedure setQueueWithStoreIDs(storeIDs: NSArray); cdecl;
    procedure setQueueWithDescriptor(descriptor
      : MPMusicPlayerQueueDescriptor); cdecl;
    procedure prependQueueDescriptor(descriptor
      : MPMusicPlayerQueueDescriptor); cdecl;
    procedure appendQueueDescriptor(descriptor
      : MPMusicPlayerQueueDescriptor); cdecl;
    procedure prepareToPlayWithCompletionHandler(completionHandler
      : TMediaPlayerCompletionHandler3); cdecl;
    procedure skipToNextItem; cdecl;
    procedure skipToBeginning; cdecl;
    procedure skipToPreviousItem; cdecl;
    procedure beginGeneratingPlaybackNotifications; cdecl;
    procedure endGeneratingPlaybackNotifications; cdecl;
    procedure setIPodMusicPlayer(iPodMusicPlayer
      : MPMusicPlayerController); cdecl;
    function iPodMusicPlayer: MPMusicPlayerController; cdecl;
  end;

  TMPMusicPlayerController = class
    (TOCGenericImport<MPMusicPlayerControllerClass, MPMusicPlayerController>)
  end;

  PMPMusicPlayerController = Pointer;

  MPMusicPlayerApplicationControllerClass = interface
    (MPMusicPlayerControllerClass)
    ['{B4592A3B-76BC-44AB-9586-51A732F52B2F}']
  end;

  MPMusicPlayerApplicationController = interface(MPMusicPlayerController)
    ['{FB110368-B860-43EA-B268-3C2EA97A7256}']
    procedure performQueueTransaction(queueTransaction
      : TMediaPlayerQueueTransaction;
      completionHandler: TMediaPlayerCompletionHandler4); cdecl;
  end;

  TMPMusicPlayerApplicationController = class
    (TOCGenericImport<MPMusicPlayerApplicationControllerClass,
    MPMusicPlayerApplicationController>)
  end;

  PMPMusicPlayerApplicationController = Pointer;

  MPMusicPlayerControllerQueueClass = interface(NSObjectClass)
    ['{9618BBE8-CB34-4909-BA7C-4524A0BD18B7}']
  end;

  MPMusicPlayerControllerQueue = interface(NSObject)
    ['{E3204457-2B4D-4D25-9041-1E00493E36A5}']
    function items: NSArray; cdecl;
  end;

  TMPMusicPlayerControllerQueue = class
    (TOCGenericImport<MPMusicPlayerControllerQueueClass,
    MPMusicPlayerControllerQueue>)
  end;

  PMPMusicPlayerControllerQueue = Pointer;

  MPMusicPlayerControllerMutableQueueClass = interface
    (MPMusicPlayerControllerQueueClass)
    ['{2298C607-09A5-44F5-A258-FBE60AC8521D}']
  end;

  MPMusicPlayerControllerMutableQueue = interface(MPMusicPlayerControllerQueue)
    ['{93417972-76C2-49EE-AAEE-FDC41F1D937D}']
    procedure insertQueueDescriptor(queueDescriptor
      : MPMusicPlayerQueueDescriptor; afterItem: MPMediaItem); cdecl;
    procedure removeItem(item: MPMediaItem); cdecl;
  end;

  TMPMusicPlayerControllerMutableQueue = class
    (TOCGenericImport<MPMusicPlayerControllerMutableQueueClass,
    MPMusicPlayerControllerMutableQueue>)
  end;

  PMPMusicPlayerControllerMutableQueue = Pointer;

  MPNowPlayingInfoCenterClass = interface(NSObjectClass)
    ['{83EC3F8A-0CD2-409B-AC72-E4A0C335B6BE}']
    { class } function defaultCenter: MPNowPlayingInfoCenter; cdecl;
  end;

  MPNowPlayingInfoCenter = interface(NSObject)
    ['{98C4AC84-21A2-45FE-9994-CEC8B8F1153D}']
    procedure setNowPlayingInfo(nowPlayingInfo: NSDictionary); cdecl;
    function nowPlayingInfo: NSDictionary; cdecl;
    procedure setPlaybackState(playbackState: MPNowPlayingPlaybackState); cdecl;
    function playbackState: MPNowPlayingPlaybackState; cdecl;
  end;

  TMPNowPlayingInfoCenter = class(TOCGenericImport<MPNowPlayingInfoCenterClass,
    MPNowPlayingInfoCenter>)
  end;

  PMPNowPlayingInfoCenter = Pointer;

  MPRemoteCommandCenterClass = interface(NSObjectClass)
    ['{07752A02-24B7-4AB2-B2B0-1E34201B60D8}']
    { class } function sharedCommandCenter: MPRemoteCommandCenter; cdecl;
  end;

  MPRemoteCommandCenter = interface(NSObject)
    ['{79F89CC9-A1FB-4C92-B887-5FD0734D5849}']
    function pauseCommand: MPRemoteCommand; cdecl;
    function playCommand: MPRemoteCommand; cdecl;
    function stopCommand: MPRemoteCommand; cdecl;
    function togglePlayPauseCommand: MPRemoteCommand; cdecl;
    function enableLanguageOptionCommand: MPRemoteCommand; cdecl;
    function disableLanguageOptionCommand: MPRemoteCommand; cdecl;
    function changePlaybackRateCommand: MPChangePlaybackRateCommand; cdecl;
    function changeRepeatModeCommand: MPChangeRepeatModeCommand; cdecl;
    function changeShuffleModeCommand: MPChangeShuffleModeCommand; cdecl;
    function nextTrackCommand: MPRemoteCommand; cdecl;
    function previousTrackCommand: MPRemoteCommand; cdecl;
    function skipForwardCommand: MPSkipIntervalCommand; cdecl;
    function skipBackwardCommand: MPSkipIntervalCommand; cdecl;
    function seekForwardCommand: MPRemoteCommand; cdecl;
    function seekBackwardCommand: MPRemoteCommand; cdecl;
    function changePlaybackPositionCommand
      : MPChangePlaybackPositionCommand; cdecl;
    function ratingCommand: MPRatingCommand; cdecl;
    function likeCommand: MPFeedbackCommand; cdecl;
    function dislikeCommand: MPFeedbackCommand; cdecl;
    function bookmarkCommand: MPFeedbackCommand; cdecl;
  end;

  TMPRemoteCommandCenter = class(TOCGenericImport<MPRemoteCommandCenterClass,
    MPRemoteCommandCenter>)
  end;

  PMPRemoteCommandCenter = Pointer;

  MPAdTimeRangeClass = interface(NSObjectClass)
    ['{923564BD-6834-4C3F-AE9C-E96E9534B053}']
  end;

  MPAdTimeRange = interface(NSObject)
    ['{2DF799AB-8627-4EB5-96FC-688DB677AF57}']
    procedure setTimeRange(timeRange: CMTimeRange); cdecl;
    function timeRange: CMTimeRange; cdecl;
    function initWithTimeRange(timeRange: CMTimeRange)
      : Pointer { instancetype }; cdecl;
  end;

  TMPAdTimeRange = class(TOCGenericImport<MPAdTimeRangeClass, MPAdTimeRange>)
  end;

  PMPAdTimeRange = Pointer;

  MPNowPlayingSessionClass = interface(NSObjectClass)
    ['{FC084B67-86FB-42D6-AA2E-16ABF82A77A2}']
  end;

  MPNowPlayingSession = interface(NSObject)
    ['{FD276117-FC5E-4783-B2AF-03A9131F509A}']
    function initWithPlayers(players: NSArray): Pointer { instancetype }; cdecl;
    function players: NSArray; cdecl;
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    procedure setAutomaticallyPublishesNowPlayingInfo
      (automaticallyPublishesNowPlayingInfo: Boolean); cdecl;
    function automaticallyPublishesNowPlayingInfo: Boolean; cdecl;
    function nowPlayingInfoCenter: MPNowPlayingInfoCenter; cdecl;
    function remoteCommandCenter: MPRemoteCommandCenter; cdecl;
    function canBecomeActive: Boolean; cdecl;
    function isActive: Boolean; cdecl;
    procedure becomeActiveIfPossibleWithCompletion
      (completion: TMediaPlayerCompletion); cdecl;
    procedure addPlayer(player: AVPlayer); cdecl;
    procedure removePlayer(player: AVPlayer); cdecl;
  end;

  TMPNowPlayingSession = class(TOCGenericImport<MPNowPlayingSessionClass,
    MPNowPlayingSession>)
  end;

  PMPNowPlayingSession = Pointer;

  MPPlayableContentManagerClass = interface(NSObjectClass)
    ['{E84575E4-61CD-480D-B792-DC840CEB9356}']
    { class } function sharedContentManager: Pointer { instancetype }; cdecl;
  end;

  MPPlayableContentManager = interface(NSObject)
    ['{89C05213-EFE2-4B03-8610-2C7D94FA10BD}']
    procedure setDataSource(dataSource: Pointer); cdecl;
    function dataSource: Pointer; cdecl;
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    function context: MPPlayableContentManagerContext; cdecl;
    procedure setNowPlayingIdentifiers(nowPlayingIdentifiers: NSArray); cdecl;
    function nowPlayingIdentifiers: NSArray; cdecl;
    procedure reloadData; cdecl;
    procedure beginUpdates; cdecl;
    procedure endUpdates; cdecl;
  end;

  TMPPlayableContentManager = class
    (TOCGenericImport<MPPlayableContentManagerClass, MPPlayableContentManager>)
  end;

  PMPPlayableContentManager = Pointer;

  MPPlayableContentManagerContextClass = interface(NSObjectClass)
    ['{95944019-E99C-454F-B5F2-B1F6744E6ADF}']
  end;

  MPPlayableContentManagerContext = interface(NSObject)
    ['{99271E09-C729-4AFD-BAE5-77ACD2C238A1}']
    function enforcedContentItemsCount: NSInteger; cdecl;
    function enforcedContentTreeDepth: NSInteger; cdecl;
    function contentLimitsEnforced: Boolean; cdecl;
    function contentLimitsEnabled: Boolean; cdecl;
    function endpointAvailable: Boolean; cdecl;
  end;

  TMPPlayableContentManagerContext = class
    (TOCGenericImport<MPPlayableContentManagerContextClass,
    MPPlayableContentManagerContext>)
  end;

  PMPPlayableContentManagerContext = Pointer;

  MPRemoteCommandEventClass = interface(NSObjectClass)
    ['{E4710824-19FC-4360-8DA8-8EC01D344349}']
  end;

  MPRemoteCommandEvent = interface(NSObject)
    ['{FA0F5791-4D0B-42EE-B111-9935121AFCEF}']
    function command: MPRemoteCommand; cdecl;
    function timestamp: NSTimeInterval; cdecl;
  end;

  TMPRemoteCommandEvent = class(TOCGenericImport<MPRemoteCommandEventClass,
    MPRemoteCommandEvent>)
  end;

  PMPRemoteCommandEvent = Pointer;

  MPRemoteCommandClass = interface(NSObjectClass)
    ['{DE90E11A-55EC-4733-A072-39CB7ADA810B}']
  end;

  MPRemoteCommand = interface(NSObject)
    ['{878038BE-F698-4A91-821F-E02509927766}']
    procedure setEnabled(enabled: Boolean); cdecl;
    function isEnabled: Boolean; cdecl;
    procedure addTarget(target: Pointer; action: SEL); cdecl;
    [MethodName('removeTarget:action:')]
    procedure removeTargetAction(target: Pointer; action: SEL); cdecl;
    [MethodName('removeTarget:')]
    procedure removeTarget(target: Pointer); cdecl;
    function addTargetWithHandler(handler: TMediaPlayerHandler): Pointer; cdecl;
  end;

  TMPRemoteCommand = class(TOCGenericImport<MPRemoteCommandClass,
    MPRemoteCommand>)
  end;

  PMPRemoteCommand = Pointer;

  MPSkipIntervalCommandClass = interface(MPRemoteCommandClass)
    ['{5241AFFD-4822-4274-8C18-CB51386450CF}']
  end;

  MPSkipIntervalCommand = interface(MPRemoteCommand)
    ['{E05BDC81-6E4D-49C8-9653-AE38DFE33A9B}']
    procedure setPreferredIntervals(preferredIntervals: NSArray); cdecl;
    function preferredIntervals: NSArray; cdecl;
  end;

  TMPSkipIntervalCommand = class(TOCGenericImport<MPSkipIntervalCommandClass,
    MPSkipIntervalCommand>)
  end;

  PMPSkipIntervalCommand = Pointer;

  MPFeedbackCommandClass = interface(MPRemoteCommandClass)
    ['{8E046525-9A0D-4042-AD9F-2B2F35F90062}']
  end;

  MPFeedbackCommand = interface(MPRemoteCommand)
    ['{306E9085-DED5-4CC6-B9FF-0B1B4CCF8141}']
    procedure setActive(active: Boolean); cdecl;
    function isActive: Boolean; cdecl;
    procedure setLocalizedTitle(localizedTitle: NSString); cdecl;
    function localizedTitle: NSString; cdecl;
    procedure setLocalizedShortTitle(localizedShortTitle: NSString); cdecl;
    function localizedShortTitle: NSString; cdecl;
  end;

  TMPFeedbackCommand = class(TOCGenericImport<MPFeedbackCommandClass,
    MPFeedbackCommand>)
  end;

  PMPFeedbackCommand = Pointer;

  MPRatingCommandClass = interface(MPRemoteCommandClass)
    ['{724AB7EF-5862-47C1-957C-947490FC5639}']
  end;

  MPRatingCommand = interface(MPRemoteCommand)
    ['{BF497A97-5616-48B2-AEF8-B7D9BE3ED427}']
    procedure setMinimumRating(minimumRating: Single); cdecl;
    function minimumRating: Single; cdecl;
    procedure setMaximumRating(maximumRating: Single); cdecl;
    function maximumRating: Single; cdecl;
  end;

  TMPRatingCommand = class(TOCGenericImport<MPRatingCommandClass,
    MPRatingCommand>)
  end;

  PMPRatingCommand = Pointer;

  MPChangePlaybackRateCommandClass = interface(MPRemoteCommandClass)
    ['{F08269F1-8845-4E73-8400-243ED042FE03}']
  end;

  MPChangePlaybackRateCommand = interface(MPRemoteCommand)
    ['{A9F3E689-A4AE-460B-94B6-1F1070275ED9}']
    procedure setSupportedPlaybackRates(supportedPlaybackRates: NSArray); cdecl;
    function supportedPlaybackRates: NSArray; cdecl;
  end;

  TMPChangePlaybackRateCommand = class
    (TOCGenericImport<MPChangePlaybackRateCommandClass,
    MPChangePlaybackRateCommand>)
  end;

  PMPChangePlaybackRateCommand = Pointer;

  MPChangePlaybackPositionCommandClass = interface(MPRemoteCommandClass)
    ['{BDE73EE4-81D3-446B-93CD-A70CEAC15338}']
  end;

  MPChangePlaybackPositionCommand = interface(MPRemoteCommand)
    ['{8B9164B1-892D-4F72-830F-C228D64F8936}']
  end;

  TMPChangePlaybackPositionCommand = class
    (TOCGenericImport<MPChangePlaybackPositionCommandClass,
    MPChangePlaybackPositionCommand>)
  end;

  PMPChangePlaybackPositionCommand = Pointer;

  MPChangeShuffleModeCommandClass = interface(MPRemoteCommandClass)
    ['{5B19816C-362A-429C-95EB-250C71CF5049}']
  end;

  MPChangeShuffleModeCommand = interface(MPRemoteCommand)
    ['{D8E9A8F5-1518-4E44-A311-24EAEE2F4A15}']
    procedure setCurrentShuffleType(currentShuffleType: MPShuffleType); cdecl;
    function currentShuffleType: MPShuffleType; cdecl;
  end;

  TMPChangeShuffleModeCommand = class
    (TOCGenericImport<MPChangeShuffleModeCommandClass,
    MPChangeShuffleModeCommand>)
  end;

  PMPChangeShuffleModeCommand = Pointer;

  MPChangeRepeatModeCommandClass = interface(MPRemoteCommandClass)
    ['{63C7F1B6-7FD2-4777-91C7-F3B81CC004CF}']
  end;

  MPChangeRepeatModeCommand = interface(MPRemoteCommand)
    ['{11FAB8CC-49A7-444F-AFA7-6484AFDAECBF}']
    procedure setCurrentRepeatType(currentRepeatType: MPRepeatType); cdecl;
    function currentRepeatType: MPRepeatType; cdecl;
  end;

  TMPChangeRepeatModeCommand = class
    (TOCGenericImport<MPChangeRepeatModeCommandClass,
    MPChangeRepeatModeCommand>)
  end;

  PMPChangeRepeatModeCommand = Pointer;

  MPSkipIntervalCommandEventClass = interface(MPRemoteCommandEventClass)
    ['{A8D5104D-9EEF-4C17-9331-D772819FF712}']
  end;

  MPSkipIntervalCommandEvent = interface(MPRemoteCommandEvent)
    ['{F8B75AD1-C485-4EF7-A970-2690FBBC6DA6}']
    function interval: NSTimeInterval; cdecl;
  end;

  TMPSkipIntervalCommandEvent = class
    (TOCGenericImport<MPSkipIntervalCommandEventClass,
    MPSkipIntervalCommandEvent>)
  end;

  PMPSkipIntervalCommandEvent = Pointer;

  MPSeekCommandEventClass = interface(MPRemoteCommandEventClass)
    ['{5E3AE1D5-1E89-40E2-8CA7-B5CCA2248123}']
  end;

  MPSeekCommandEvent = interface(MPRemoteCommandEvent)
    ['{10AA802C-7B7E-451B-9438-F20A1C2C148B}']
    function &type: MPSeekCommandEventType; cdecl;
  end;

  TMPSeekCommandEvent = class(TOCGenericImport<MPSeekCommandEventClass,
    MPSeekCommandEvent>)
  end;

  PMPSeekCommandEvent = Pointer;

  MPRatingCommandEventClass = interface(MPRemoteCommandEventClass)
    ['{795D46D6-C8D3-4523-A8F6-D9C63C4F0597}']
  end;

  MPRatingCommandEvent = interface(MPRemoteCommandEvent)
    ['{F46B60B8-8596-41A5-8FBF-20067432CFDA}']
    function rating: Single; cdecl;
  end;

  TMPRatingCommandEvent = class(TOCGenericImport<MPRatingCommandEventClass,
    MPRatingCommandEvent>)
  end;

  PMPRatingCommandEvent = Pointer;

  MPChangePlaybackRateCommandEventClass = interface(MPRemoteCommandEventClass)
    ['{CA606DAF-EB66-40FE-A989-62B215061752}']
  end;

  MPChangePlaybackRateCommandEvent = interface(MPRemoteCommandEvent)
    ['{E2B12E74-8707-4F6C-9F4B-5AD373BB5D17}']
    function playbackRate: Single; cdecl;
  end;

  TMPChangePlaybackRateCommandEvent = class
    (TOCGenericImport<MPChangePlaybackRateCommandEventClass,
    MPChangePlaybackRateCommandEvent>)
  end;

  PMPChangePlaybackRateCommandEvent = Pointer;

  MPFeedbackCommandEventClass = interface(MPRemoteCommandEventClass)
    ['{7F7E3902-F524-4496-A78D-2B77C6F1DE23}']
  end;

  MPFeedbackCommandEvent = interface(MPRemoteCommandEvent)
    ['{101CC9CC-83B1-4DD2-9A5E-A8AFB65E681A}']
    function isNegative: Boolean; cdecl;
  end;

  TMPFeedbackCommandEvent = class(TOCGenericImport<MPFeedbackCommandEventClass,
    MPFeedbackCommandEvent>)
  end;

  PMPFeedbackCommandEvent = Pointer;

  MPChangeLanguageOptionCommandEventClass = interface(MPRemoteCommandEventClass)
    ['{29DA6F73-34BA-4E41-BDB7-8B6EB0C4A22D}']
  end;

  MPChangeLanguageOptionCommandEvent = interface(MPRemoteCommandEvent)
    ['{5471AA95-E03F-4315-9C84-C1E21042D063}']
    function languageOption: MPNowPlayingInfoLanguageOption; cdecl;
    function setting: MPChangeLanguageOptionSetting; cdecl;
  end;

  TMPChangeLanguageOptionCommandEvent = class
    (TOCGenericImport<MPChangeLanguageOptionCommandEventClass,
    MPChangeLanguageOptionCommandEvent>)
  end;

  PMPChangeLanguageOptionCommandEvent = Pointer;

  MPChangePlaybackPositionCommandEventClass = interface
    (MPRemoteCommandEventClass)
    ['{34766DFB-8539-4D77-80E8-6FA011E6E247}']
  end;

  MPChangePlaybackPositionCommandEvent = interface(MPRemoteCommandEvent)
    ['{CED95D4E-3F3D-4DB3-A12B-5269DFA30A53}']
    function positionTime: NSTimeInterval; cdecl;
  end;

  TMPChangePlaybackPositionCommandEvent = class
    (TOCGenericImport<MPChangePlaybackPositionCommandEventClass,
    MPChangePlaybackPositionCommandEvent>)
  end;

  PMPChangePlaybackPositionCommandEvent = Pointer;

  MPChangeShuffleModeCommandEventClass = interface(MPRemoteCommandEventClass)
    ['{7BBFA460-E5F8-4E43-8C47-2D295D8E09EB}']
  end;

  MPChangeShuffleModeCommandEvent = interface(MPRemoteCommandEvent)
    ['{A7B0AE99-948A-43F6-9FF2-48BB2A3E999A}']
    function shuffleType: MPShuffleType; cdecl;
    function preservesShuffleMode: Boolean; cdecl;
  end;

  TMPChangeShuffleModeCommandEvent = class
    (TOCGenericImport<MPChangeShuffleModeCommandEventClass,
    MPChangeShuffleModeCommandEvent>)
  end;

  PMPChangeShuffleModeCommandEvent = Pointer;

  MPChangeRepeatModeCommandEventClass = interface(MPRemoteCommandEventClass)
    ['{8F32E3E0-503B-43D8-B4DD-924D54AA7E7A}']
  end;

  MPChangeRepeatModeCommandEvent = interface(MPRemoteCommandEvent)
    ['{6FBA7EF8-249F-4733-A99F-A36AAE57208F}']
    function repeatType: MPRepeatType; cdecl;
    function preservesRepeatMode: Boolean; cdecl;
  end;

  TMPChangeRepeatModeCommandEvent = class
    (TOCGenericImport<MPChangeRepeatModeCommandEventClass,
    MPChangeRepeatModeCommandEvent>)
  end;

  PMPChangeRepeatModeCommandEvent = Pointer;

  MPVolumeViewClass = interface(UIViewClass)
    ['{0465D5E4-0379-43A1-83A8-7D92BA3DBC81}']
  end;

  MPVolumeView = interface(UIView)
    ['{59A17097-AF79-4C30-ABD4-E7FC120EB664}']
    procedure setShowsVolumeSlider(showsVolumeSlider: Boolean); cdecl;
    function showsVolumeSlider: Boolean; cdecl;
    procedure setShowsRouteButton(showsRouteButton: Boolean); cdecl;
    function showsRouteButton: Boolean; cdecl;
    function areWirelessRoutesAvailable: Boolean; cdecl;
    function isWirelessRouteActive: Boolean; cdecl;
    procedure setMinimumVolumeSliderImage(image: UIImage;
      forState: UIControlState); cdecl;
    procedure setMaximumVolumeSliderImage(image: UIImage;
      forState: UIControlState); cdecl;
    procedure setVolumeThumbImage(image: UIImage;
      forState: UIControlState); cdecl;
    function minimumVolumeSliderImageForState(state: UIControlState)
      : UIImage; cdecl;
    function maximumVolumeSliderImageForState(state: UIControlState)
      : UIImage; cdecl;
    function volumeThumbImageForState(state: UIControlState): UIImage; cdecl;
    procedure setVolumeWarningSliderImage(volumeWarningSliderImage
      : UIImage); cdecl;
    function volumeWarningSliderImage: UIImage; cdecl;
    function volumeSliderRectForBounds(bounds: CGRect): CGRect; cdecl;
    function volumeThumbRectForBounds(bounds: CGRect; volumeSliderRect: CGRect;
      value: Single): CGRect; cdecl;
    procedure setRouteButtonImage(image: UIImage;
      forState: UIControlState); cdecl;
    function routeButtonImageForState(state: UIControlState): UIImage; cdecl;
    function routeButtonRectForBounds(bounds: CGRect): CGRect; cdecl;
  end;

  TMPVolumeView = class(TOCGenericImport<MPVolumeViewClass, MPVolumeView>)
  end;

  PMPVolumeView = Pointer;

  MediaPlayerAdditions = interface(IObjectiveC)
    ['{4185F2FD-09AF-470C-9A08-39301ECF019D}']
    procedure setExternalMediaContentIdentifier(externalMediaContentIdentifier
      : NSString); cdecl;
    function externalMediaContentIdentifier: NSString; cdecl;
  end;

  // ===== Protocol declarations =====

  MPMediaPickerControllerDelegate = interface(IObjectiveC)
    ['{6118562B-CF9A-4A36-84A2-89B56B41F252}']
    procedure mediaPicker(mediaPicker: MPMediaPickerController;
      didPickMediaItems: MPMediaItemCollection); cdecl;
    procedure mediaPickerDidCancel(mediaPicker: MPMediaPickerController); cdecl;
  end;

  MPMediaPlayback = interface(IObjectiveC)
    ['{FE49A70B-A114-4B19-B0CA-26DA7D848635}']
    procedure prepareToPlay; cdecl;
    function isPreparedToPlay: Boolean; cdecl;
    procedure play; cdecl;
    procedure pause; cdecl;
    procedure stop; cdecl;
    procedure setCurrentPlaybackTime(currentPlaybackTime
      : NSTimeInterval); cdecl;
    function currentPlaybackTime: NSTimeInterval; cdecl;
    procedure setCurrentPlaybackRate(currentPlaybackRate: Single); cdecl;
    function currentPlaybackRate: Single; cdecl;
    procedure beginSeekingForward; cdecl;
    procedure beginSeekingBackward; cdecl;
    procedure endSeeking; cdecl;
  end;

  MPSystemMusicPlayerController = interface(IObjectiveC)
    ['{EA9B5A9F-2259-4B3C-BE2C-C268BFD09AF8}']
    procedure openToPlayQueueDescriptor(queueDescriptor
      : MPMusicPlayerQueueDescriptor); cdecl;
  end;

  MPNowPlayingSessionDelegate = interface(IObjectiveC)
    ['{F8751511-C018-4AB0-8479-7A31E16D90BC}']
    procedure nowPlayingSessionDidChangeActive(nowPlayingSession
      : MPNowPlayingSession); cdecl;
    procedure nowPlayingSessionDidChangeCanBecomeActive(nowPlayingSession
      : MPNowPlayingSession); cdecl;
  end;

  MPPlayableContentDataSource = interface(IObjectiveC)
    ['{B09FCBA4-ECC8-4A6D-87BD-F61AC6B168E4}']
    procedure beginLoadingChildItemsAtIndexPath(indexPath: NSIndexPath;
      completionHandler: TMediaPlayerCompletionHandler3); cdecl;
    function childItemsDisplayPlaybackProgressAtIndexPath
      (indexPath: NSIndexPath): Boolean; cdecl;
    procedure contentItemForIdentifier(identifier: NSString;
      completionHandler: TMediaPlayerCompletionHandler5); cdecl;
    function numberOfChildItemsAtIndexPath(indexPath: NSIndexPath)
      : NSInteger; cdecl;
    function contentItemAtIndexPath(indexPath: NSIndexPath)
      : MPContentItem; cdecl;
  end;

  MPPlayableContentDelegate = interface(IObjectiveC)
    ['{A056852A-8085-4E09-A305-DBC768E104E4}']
    [MethodName
      ('playableContentManager:initiatePlaybackOfContentItemAtIndexPath:completionHandler:')
      ]
    procedure playableContentManagerInitiatePlaybackOfContentItemAtIndexPathCompletionHandler
      (contentManager: MPPlayableContentManager;
      initiatePlaybackOfContentItemAtIndexPath: NSIndexPath;
      completionHandler: TMediaPlayerCompletionHandler3); cdecl;
    [MethodName
      ('playableContentManager:initializePlaybackQueueWithCompletionHandler:')]
    procedure playableContentManagerInitializePlaybackQueueWithCompletionHandler
      (contentManager: MPPlayableContentManager;
      initializePlaybackQueueWithCompletionHandler
      : TMediaPlayerCompletionHandler3); cdecl;
    [MethodName
      ('playableContentManager:initializePlaybackQueueWithContentItems:completionHandler:')
      ]
    procedure playableContentManagerInitializePlaybackQueueWithContentItemsCompletionHandler
      (contentManager: MPPlayableContentManager;
      initializePlaybackQueueWithContentItems: NSArray;
      completionHandler: TMediaPlayerCompletionHandler3); cdecl;
    [MethodName('playableContentManager:didUpdateContext:')]
    procedure playableContentManagerDidUpdateContext(contentManager
      : MPPlayableContentManager;
      didUpdateContext: MPPlayableContentManagerContext); cdecl;
  end;

  // ===== Exported string consts =====

function MPErrorDomain: NSString;
function MPMediaEntityPropertyPersistentID: NSString;
function MPMediaItemPropertyPersistentID: NSString;
function MPMediaItemPropertyMediaType: NSString;
function MPMediaItemPropertyTitle: NSString;
function MPMediaItemPropertyAlbumTitle: NSString;
function MPMediaItemPropertyAlbumPersistentID: NSString;
function MPMediaItemPropertyArtist: NSString;
function MPMediaItemPropertyArtistPersistentID: NSString;
function MPMediaItemPropertyAlbumArtist: NSString;
function MPMediaItemPropertyAlbumArtistPersistentID: NSString;
function MPMediaItemPropertyGenre: NSString;
function MPMediaItemPropertyGenrePersistentID: NSString;
function MPMediaItemPropertyComposer: NSString;
function MPMediaItemPropertyComposerPersistentID: NSString;
function MPMediaItemPropertyPlaybackDuration: NSString;
function MPMediaItemPropertyAlbumTrackNumber: NSString;
function MPMediaItemPropertyAlbumTrackCount: NSString;
function MPMediaItemPropertyDiscNumber: NSString;
function MPMediaItemPropertyDiscCount: NSString;
function MPMediaItemPropertyArtwork: NSString;
function MPMediaItemPropertyIsExplicit: NSString;
function MPMediaItemPropertyLyrics: NSString;
function MPMediaItemPropertyIsCompilation: NSString;
function MPMediaItemPropertyReleaseDate: NSString;
function MPMediaItemPropertyBeatsPerMinute: NSString;
function MPMediaItemPropertyComments: NSString;
function MPMediaItemPropertyAssetURL: NSString;
function MPMediaItemPropertyIsCloudItem: NSString;
function MPMediaItemPropertyHasProtectedAsset: NSString;
function MPMediaItemPropertyPodcastTitle: NSString;
function MPMediaItemPropertyPodcastPersistentID: NSString;
function MPMediaItemPropertyPlayCount: NSString;
function MPMediaItemPropertySkipCount: NSString;
function MPMediaItemPropertyRating: NSString;
function MPMediaItemPropertyLastPlayedDate: NSString;
function MPMediaItemPropertyUserGrouping: NSString;
function MPMediaItemPropertyBookmarkTime: NSString;
function MPMediaItemPropertyDateAdded: NSString;
function MPMediaItemPropertyPlaybackStoreID: NSString;
function MPMediaItemPropertyIsPreorder: NSString;
function MPMediaLibraryDidChangeNotification: NSString;
function MPMediaPlaylistPropertyPersistentID: NSString;
function MPMediaPlaylistPropertyCloudGlobalID: NSString;
function MPMediaPlaylistPropertyName: NSString;
function MPMediaPlaylistPropertyPlaylistAttributes: NSString;
function MPMediaPlaylistPropertySeedItems: NSString;
function MPMediaPlaylistPropertyDescriptionText: NSString;
function MPMediaPlaylistPropertyAuthorDisplayName: NSString;
function MPMediaPlaybackIsPreparedToPlayDidChangeNotification: NSString;
function MPMoviePlayerScalingModeDidChangeNotification: NSString;
function MPMoviePlayerPlaybackDidFinishNotification: NSString;
function MPMoviePlayerPlaybackDidFinishReasonUserInfoKey: NSString;
function MPMoviePlayerPlaybackStateDidChangeNotification: NSString;
function MPMoviePlayerLoadStateDidChangeNotification: NSString;
function MPMoviePlayerNowPlayingMovieDidChangeNotification: NSString;
function MPMoviePlayerWillEnterFullscreenNotification: NSString;
function MPMoviePlayerDidEnterFullscreenNotification: NSString;
function MPMoviePlayerWillExitFullscreenNotification: NSString;
function MPMoviePlayerDidExitFullscreenNotification: NSString;
function MPMoviePlayerFullscreenAnimationDurationUserInfoKey: NSString;
function MPMoviePlayerFullscreenAnimationCurveUserInfoKey: NSString;
function MPMoviePlayerIsAirPlayVideoActiveDidChangeNotification: NSString;
function MPMoviePlayerReadyForDisplayDidChangeNotification: NSString;
function MPMovieMediaTypesAvailableNotification: NSString;
function MPMovieSourceTypeAvailableNotification: NSString;
function MPMovieDurationAvailableNotification: NSString;
function MPMovieNaturalSizeAvailableNotification: NSString;
function MPMoviePlayerThumbnailImageRequestDidFinishNotification: NSString;
function MPMoviePlayerThumbnailImageKey: NSString;
function MPMoviePlayerThumbnailTimeKey: NSString;
function MPMoviePlayerThumbnailErrorKey: NSString;
function MPMoviePlayerTimedMetadataUpdatedNotification: NSString;
function MPMoviePlayerTimedMetadataUserInfoKey: NSString;
function MPMoviePlayerTimedMetadataKeyName: NSString;
function MPMoviePlayerTimedMetadataKeyInfo: NSString;
function MPMoviePlayerTimedMetadataKeyMIMEType: NSString;
function MPMoviePlayerTimedMetadataKeyDataType: NSString;
function MPMoviePlayerTimedMetadataKeyLanguageCode: NSString;
function MPMusicPlayerControllerPlaybackStateDidChangeNotification: Pointer;
function MPMusicPlayerControllerNowPlayingItemDidChangeNotification: Pointer;
function MPMusicPlayerControllerVolumeDidChangeNotification: Pointer;
function MPMusicPlayerControllerQueueDidChangeNotification: NSString;
function MPNowPlayingInfoPropertyElapsedPlaybackTime: NSString;
function MPNowPlayingInfoPropertyPlaybackRate: NSString;
function MPNowPlayingInfoPropertyDefaultPlaybackRate: NSString;
function MPNowPlayingInfoPropertyPlaybackQueueIndex: NSString;
function MPNowPlayingInfoPropertyPlaybackQueueCount: NSString;
function MPNowPlayingInfoPropertyChapterNumber: NSString;
function MPNowPlayingInfoPropertyChapterCount: NSString;
function MPNowPlayingInfoPropertyIsLiveStream: NSString;
function MPNowPlayingInfoPropertyAvailableLanguageOptions: NSString;
function MPNowPlayingInfoPropertyCurrentLanguageOptions: NSString;
function MPNowPlayingInfoCollectionIdentifier: NSString;
function MPNowPlayingInfoPropertyExternalContentIdentifier: NSString;
function MPNowPlayingInfoPropertyExternalUserProfileIdentifier: NSString;
function MPNowPlayingInfoPropertyServiceIdentifier: NSString;
function MPNowPlayingInfoPropertyPlaybackProgress: NSString;
function MPNowPlayingInfoPropertyMediaType: NSString;
function MPNowPlayingInfoPropertyAssetURL: NSString;
function MPNowPlayingInfoPropertyCurrentPlaybackDate: NSString;
function MPNowPlayingInfoPropertyAdTimeRanges: NSString;
function MPNowPlayingInfoPropertyCreditsStartTime: NSString;
function MPLanguageOptionCharacteristicIsMainProgramContent: NSString;
function MPLanguageOptionCharacteristicIsAuxiliaryContent: NSString;
function MPLanguageOptionCharacteristicContainsOnlyForcedSubtitles: NSString;
function MPLanguageOptionCharacteristicTranscribesSpokenDialog: NSString;
function MPLanguageOptionCharacteristicDescribesMusicAndSound: NSString;
function MPLanguageOptionCharacteristicEasyToRead: NSString;
function MPLanguageOptionCharacteristicDescribesVideo: NSString;
function MPLanguageOptionCharacteristicLanguageTranslation: NSString;
function MPLanguageOptionCharacteristicDubbedTranslation: NSString;
function MPLanguageOptionCharacteristicVoiceOverTranslation: NSString;
function MPVolumeViewWirelessRoutesAvailableDidChangeNotification: NSString;
function MPVolumeViewWirelessRouteActiveDidChangeNotification: NSString;


// ===== External functions =====

const
  libMediaPlayer =
    '/System/Library/Frameworks/MediaPlayer.framework/MediaPlayer';
procedure MPVolumeSettingsAlertShow; cdecl;
  external libMediaPlayer name _PU + 'MPVolumeSettingsAlertShow';
procedure MPVolumeSettingsAlertHide; cdecl;
  external libMediaPlayer name _PU + 'MPVolumeSettingsAlertHide';
function MPVolumeSettingsAlertIsVisible: Boolean; cdecl;
  external libMediaPlayer name _PU + 'MPVolumeSettingsAlertIsVisible';

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

function MPMediaItemPropertyIsExplicit: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer, 'MPMediaItemPropertyIsExplicit');
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

function MPMediaItemPropertyDateAdded: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer, 'MPMediaItemPropertyDateAdded');
end;

function MPMediaItemPropertyPlaybackStoreID: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer,
    'MPMediaItemPropertyPlaybackStoreID');
end;

function MPMediaItemPropertyIsPreorder: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer, 'MPMediaItemPropertyIsPreorder');
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

function MPMediaPlaylistPropertyCloudGlobalID: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer,
    'MPMediaPlaylistPropertyCloudGlobalID');
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

function MPMusicPlayerControllerQueueDidChangeNotification: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer,
    'MPMusicPlayerControllerQueueDidChangeNotification');
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

function MPNowPlayingInfoPropertyIsLiveStream: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer,
    'MPNowPlayingInfoPropertyIsLiveStream');
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

function MPNowPlayingInfoCollectionIdentifier: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer,
    'MPNowPlayingInfoCollectionIdentifier');
end;

function MPNowPlayingInfoPropertyExternalContentIdentifier: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer,
    'MPNowPlayingInfoPropertyExternalContentIdentifier');
end;

function MPNowPlayingInfoPropertyExternalUserProfileIdentifier: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer,
    'MPNowPlayingInfoPropertyExternalUserProfileIdentifier');
end;

function MPNowPlayingInfoPropertyServiceIdentifier: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer,
    'MPNowPlayingInfoPropertyServiceIdentifier');
end;

function MPNowPlayingInfoPropertyPlaybackProgress: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer,
    'MPNowPlayingInfoPropertyPlaybackProgress');
end;

function MPNowPlayingInfoPropertyMediaType: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer,
    'MPNowPlayingInfoPropertyMediaType');
end;

function MPNowPlayingInfoPropertyAssetURL: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer,
    'MPNowPlayingInfoPropertyAssetURL');
end;

function MPNowPlayingInfoPropertyCurrentPlaybackDate: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer,
    'MPNowPlayingInfoPropertyCurrentPlaybackDate');
end;

function MPNowPlayingInfoPropertyAdTimeRanges: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer,
    'MPNowPlayingInfoPropertyAdTimeRanges');
end;

function MPNowPlayingInfoPropertyCreditsStartTime: NSString;
begin
  Result := CocoaNSStringConst(libMediaPlayer,
    'MPNowPlayingInfoPropertyCreditsStartTime');
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

function MPMusicPlayerControllerPlaybackStateDidChangeNotification: Pointer;
begin
  Result := CocoaPointerConst(libMediaPlayer,
    'MPMusicPlayerControllerPlaybackStateDidChangeNotification');
end;

function MPMusicPlayerControllerNowPlayingItemDidChangeNotification: Pointer;
begin
  Result := CocoaPointerConst(libMediaPlayer,
    'MPMusicPlayerControllerNowPlayingItemDidChangeNotification');
end;

function MPMusicPlayerControllerVolumeDidChangeNotification: Pointer;
begin
  Result := CocoaPointerConst(libMediaPlayer,
    'MPMusicPlayerControllerVolumeDidChangeNotification');
end;

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

MediaPlayerModule := dlopen(MarshaledAString(libMediaPlayer), RTLD_LAZY);

finalization

dlclose(MediaPlayerModule);
{$ENDIF IOS}

end.
