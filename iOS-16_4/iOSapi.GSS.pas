{ *********************************************************** }
{ }
{ CodeGear Delphi Runtime Library }
{ }
{ Copyright(c) 2012-2014 Embarcadero Technologies, Inc. }
{ }
{ *********************************************************** }

//
// Delphi-Objective-C Bridge
// Interfaces for Cocoa framework GSS
//

unit iOSapi.GSS;

interface

uses
  Macapi.CoreFoundation,
  Macapi.CoreServices,
  Macapi.Dispatch,
  Macapi.Mach,
  Macapi.ObjCRuntime,
  Macapi.ObjectiveC,
  iOSapi.CocoaTypes,
  iOSapi.Foundation;

type
  // ===== Framework typedefs =====
{$M+}
  OM_uint32 = LongWord;
  POM_uint32 = ^OM_uint32;
  OM_uint64 = UInt64;
  POM_uint64 = ^OM_uint64;
  gss_uint32 = LongWord;
  Pgss_uint32 = ^gss_uint32;
  gss_name_t = Pointer;
  Pgss_name_t = ^gss_name_t;
  gss_const_name_t = Pointer;
  Pgss_const_name_t = ^gss_const_name_t;
  gss_ctx_id_t = Pointer;
  Pgss_ctx_id_t = ^gss_ctx_id_t;

  gss_ctx_id_t_desc_struct = record
  end;

  Pgss_ctx_id_t_desc_struct = ^gss_ctx_id_t_desc_struct;
  gss_const_ctx_id_t = gss_ctx_id_t_desc_struct;
  Pgss_const_ctx_id_t = ^gss_const_ctx_id_t;

  gss_OID_desc_struct = record
    length: OM_uint32;
    elements: Pointer;
  end;

  Pgss_OID_desc_struct = ^gss_OID_desc_struct;
  gss_OID_desc = gss_OID_desc_struct;
  Pgss_OID_desc = ^gss_OID_desc;

  gss_OID = Pointer;
  Pgss_OID = ^gss_OID;
  gss_const_OID = Pointer;
  Pgss_const_OID = ^gss_const_OID;
  __darwin_size_t = LongWord;
  P__darwin_size_t = ^__darwin_size_t;

  gss_OID_set_desc_struct = record
    count: LongWord;
    elements: gss_OID;
  end;

  Pgss_OID_set_desc_struct = ^gss_OID_set_desc_struct;
  gss_OID_set_desc = gss_OID_set_desc_struct;
  Pgss_OID_set_desc = ^gss_OID_set_desc;

  gss_OID_set = Pointer;
  Pgss_OID_set = ^gss_OID_set;
  gss_const_OID_set = Pointer;
  Pgss_const_OID_set = ^gss_const_OID_set;
  gss_cred_usage_t = Integer;
  Pgss_cred_usage_t = ^gss_cred_usage_t;

  gss_cred_id_t = Pointer;
  Pgss_cred_id_t = ^gss_cred_id_t;
  gss_const_cred_id_t = Pointer;
  Pgss_const_cred_id_t = ^gss_const_cred_id_t;

  gss_buffer_desc_struct = record
    length: LongWord;
    value: Pointer;
  end;

  Pgss_buffer_desc_struct = ^gss_buffer_desc_struct;
  gss_buffer_desc = gss_buffer_desc_struct;
  Pgss_buffer_desc = ^gss_buffer_desc;

  gss_buffer_t = Pointer;
  Pgss_buffer_t = ^gss_buffer_t;
  gss_const_buffer_t = Pointer;
  Pgss_const_buffer_t = ^gss_const_buffer_t;
  gss_channel_bindings_t = Pointer;
  Pgss_channel_bindings_t = ^gss_channel_bindings_t;
  gss_const_channel_bindings_t = Pointer;
  Pgss_const_channel_bindings_t = ^gss_const_channel_bindings_t;

  gss_buffer_set_desc_struct = record
    count: LongWord;
    elements: Pointer;
  end;

  Pgss_buffer_set_desc_struct = ^gss_buffer_set_desc_struct;
  gss_buffer_set_desc = gss_buffer_set_desc_struct;
  Pgss_buffer_set_desc = ^gss_buffer_set_desc;

  gss_buffer_set_t = Pointer;
  Pgss_buffer_set_t = ^gss_buffer_set_t;

  gss_iov_buffer_desc_struct = record
    &type: OM_uint32;
    buffer: gss_buffer_desc;
  end;

  Pgss_iov_buffer_desc_struct = ^gss_iov_buffer_desc_struct;
  gss_iov_buffer_desc = gss_iov_buffer_desc_struct;
  Pgss_iov_buffer_desc = ^gss_iov_buffer_desc;

  gss_iov_buffer_t = Pointer;
  Pgss_iov_buffer_t = ^gss_iov_buffer_t;
  gss_qop_t = OM_uint32;
  Pgss_qop_t = ^gss_qop_t;
  gss_status_id_t = POM_uint32;
  Pgss_status_id_t = ^gss_status_id_t;
  gss_auth_identity_t = Pointer;
  Pgss_auth_identity_t = ^gss_auth_identity_t;
  TGSSUseriter = procedure(param1: gss_OID; param2: gss_cred_id_t) of object;
  TGSSUseriter1 = procedure(param1: Pointer; param2: gss_OID;
    param3: gss_cred_id_t); cdecl;
  __darwin_ssize_t = LongInt;
  P__darwin_ssize_t = ^__darwin_ssize_t;

  CFUUIDRef = Pointer;
  PCFUUIDRef = ^CFUUIDRef;
  CFErrorRef = Pointer;
  PCFErrorRef = ^CFErrorRef;
  CFTypeRef = Pointer;
  PCFTypeRef = ^CFTypeRef;
  CFStringRef = Pointer;
  PCFStringRef = ^CFStringRef;
  CFDictionaryRef = Pointer;
  PCFDictionaryRef = ^CFDictionaryRef;

  gss_krb5_lucid_key = record
    &type: OM_uint32;
    length: OM_uint32;
    data: Pointer;
  end;

  Pgss_krb5_lucid_key = ^gss_krb5_lucid_key;
  gss_krb5_lucid_key_t = gss_krb5_lucid_key;
  Pgss_krb5_lucid_key_t = ^gss_krb5_lucid_key_t;

  gss_krb5_rfc1964_keydata = record
    sign_alg: OM_uint32;
    seal_alg: OM_uint32;
    ctx_key: gss_krb5_lucid_key_t;
  end;

  Pgss_krb5_rfc1964_keydata = ^gss_krb5_rfc1964_keydata;
  gss_krb5_rfc1964_keydata_t = gss_krb5_rfc1964_keydata;
  Pgss_krb5_rfc1964_keydata_t = ^gss_krb5_rfc1964_keydata_t;

  gss_krb5_cfx_keydata = record
    have_acceptor_subkey: OM_uint32;
    ctx_key: gss_krb5_lucid_key_t;
    acceptor_subkey: gss_krb5_lucid_key_t;
  end;

  Pgss_krb5_cfx_keydata = ^gss_krb5_cfx_keydata;
  gss_krb5_cfx_keydata_t = gss_krb5_cfx_keydata;
  Pgss_krb5_cfx_keydata_t = ^gss_krb5_cfx_keydata_t;

  gss_krb5_lucid_context_v1 = record
    version: OM_uint32;
    initiate: OM_uint32;
    endtime: OM_uint32;
    send_seq: OM_uint64;
    recv_seq: OM_uint64;
    protocol: OM_uint32;
    rfc1964_kd: gss_krb5_rfc1964_keydata_t;
    cfx_kd: gss_krb5_cfx_keydata_t;
  end;

  Pgss_krb5_lucid_context_v1 = ^gss_krb5_lucid_context_v1;
  gss_krb5_lucid_context_v1_t = gss_krb5_lucid_context_v1;
  Pgss_krb5_lucid_context_v1_t = ^gss_krb5_lucid_context_v1_t;

  gss_krb5_lucid_context_version = record
    version: OM_uint32;
  end;

  Pgss_krb5_lucid_context_version = ^gss_krb5_lucid_context_version;
  gss_krb5_lucid_context_version_t = gss_krb5_lucid_context_version;
  Pgss_krb5_lucid_context_version_t = ^gss_krb5_lucid_context_version_t;

  // ===== Exported string consts =====

function __gss_krb5_copy_ccache_x_oid_desc: Pointer;
function __gss_krb5_get_tkt_flags_x_oid_desc: Pointer;
function __gss_krb5_extract_authz_data_from_sec_context_x_oid_desc: Pointer;
function __gss_krb5_compat_des3_mic_x_oid_desc: Pointer;
function __gss_krb5_register_acceptor_identity_x_oid_desc: Pointer;
function __gss_krb5_export_lucid_context_x_oid_desc: Pointer;
function __gss_krb5_export_lucid_context_v1_x_oid_desc: Pointer;
function __gss_krb5_set_dns_canonicalize_x_oid_desc: Pointer;
function __gss_krb5_get_subkey_x_oid_desc: Pointer;
function __gss_krb5_get_initiator_subkey_x_oid_desc: Pointer;
function __gss_krb5_get_acceptor_subkey_x_oid_desc: Pointer;
function __gss_krb5_send_to_kdc_x_oid_desc: Pointer;
function __gss_krb5_get_authtime_x_oid_desc: Pointer;
function __gss_krb5_get_service_keyblock_x_oid_desc: Pointer;
function __gss_krb5_set_allowable_enctypes_x_oid_desc: Pointer;
function __gss_krb5_set_default_realm_x_oid_desc: Pointer;
function __gss_krb5_ccache_name_x_oid_desc: Pointer;
function __gss_krb5_set_time_offset_x_oid_desc: Pointer;
function __gss_krb5_get_time_offset_x_oid_desc: Pointer;
function __gss_krb5_plugin_register_x_oid_desc: Pointer;
function __gss_ntlm_get_session_key_x_oid_desc: Pointer;
function __gss_c_nt_ntlm_oid_desc: Pointer;
function __gss_c_nt_dn_oid_desc: Pointer;
function __gss_krb5_nt_principal_name_referral_oid_desc: Pointer;
function __gss_c_ntlm_guest_oid_desc: Pointer;
function __gss_c_ntlm_v1_oid_desc: Pointer;
function __gss_c_ntlm_v2_oid_desc: Pointer;
function __gss_c_ntlm_session_key_oid_desc: Pointer;
function __gss_c_ntlm_force_v1_oid_desc: Pointer;
function __gss_krb5_cred_no_ci_flags_x_oid_desc: Pointer;
function __gss_c_nt_uuid_oid_desc: Pointer;
function __gss_c_ntlm_support_channelbindings_oid_desc: Pointer;
function __gss_c_ntlm_support_lm2_oid_desc: Pointer;
function __gss_krb5_import_cred_x_oid_desc: Pointer;
function __gss_c_ntlm_reset_keys_oid_desc: Pointer;
function __gss_c_cred_diag_oid_desc: Pointer;
function __gss_c_cred_validate_oid_desc: Pointer;
function __gss_c_cred_set_default_oid_desc: Pointer;
function __gss_c_cred_get_default_oid_desc: Pointer;
function __gss_c_cred_renew_oid_desc: Pointer;
function __gss_c_ctx_pfs_x_oid_desc: Pointer;
function __gss_c_ma_sasl_mech_name_oid_desc: Pointer;
function __gss_c_ma_mech_name_oid_desc: Pointer;
function __gss_c_ma_mech_description_oid_desc: Pointer;
function __gss_c_cred_password_oid_desc: Pointer;
function __gss_c_cred_certificate_oid_desc: Pointer;
function __gss_c_cred_secidentity_oid_desc: Pointer;
function __gss_c_cred_heimbase_oid_desc: Pointer;
function __gss_sasl_digest_md5_mechanism_oid_desc: Pointer;
function __gss_netlogon_mechanism_oid_desc: Pointer;
function __gss_appl_lkdc_supported_oid_desc: Pointer;
function __gss_netlogon_set_session_key_x_oid_desc: Pointer;
function __gss_netlogon_set_sign_algorithm_x_oid_desc: Pointer;
function __gss_netlogon_nt_netbios_dns_name_oid_desc: Pointer;
function __gss_c_inq_win2k_pac_x_oid_desc: Pointer;
function __gss_c_inq_sspi_session_key_oid_desc: Pointer;
function __gss_krb5_mechanism_oid_desc: Pointer;
function __gss_ntlm_mechanism_oid_desc: Pointer;
function __gss_iakerb_mechanism_oid_desc: Pointer;
function __gss_pku2u_mechanism_oid_desc: Pointer;
function __gss_spnego_mechanism_oid_desc: Pointer;
function __gss_scram_mechanism_oid_desc: Pointer;
function __gss_c_nt_user_name_oid_desc: Pointer;
function __gss_c_nt_machine_uid_name_oid_desc: Pointer;
function __gss_c_nt_string_uid_name_oid_desc: Pointer;
function __gss_c_nt_hostbased_service_x_oid_desc: Pointer;
function __gss_c_nt_hostbased_service_oid_desc: Pointer;
function __gss_c_nt_anonymous_oid_desc: Pointer;
function __gss_c_nt_export_name_oid_desc: Pointer;
function __gss_krb5_nt_principal_name_oid_desc: Pointer;
function __gss_krb5_nt_principal_oid_desc: Pointer;
function __gss_c_peer_has_updated_spnego_oid_desc: Pointer;
function __gss_c_ma_mech_concrete_oid_desc: Pointer;
function __gss_c_ma_mech_pseudo_oid_desc: Pointer;
function __gss_c_ma_mech_composite_oid_desc: Pointer;
function __gss_c_ma_mech_nego_oid_desc: Pointer;
function __gss_c_ma_mech_glue_oid_desc: Pointer;
function __gss_c_ma_not_mech_oid_desc: Pointer;
function __gss_c_ma_deprecated_oid_desc: Pointer;
function __gss_c_ma_not_dflt_mech_oid_desc: Pointer;
function __gss_c_ma_itok_framed_oid_desc: Pointer;
function __gss_c_ma_auth_init_oid_desc: Pointer;
function __gss_c_ma_auth_targ_oid_desc: Pointer;
function __gss_c_ma_auth_init_init_oid_desc: Pointer;
function __gss_c_ma_auth_targ_init_oid_desc: Pointer;
function __gss_c_ma_auth_init_anon_oid_desc: Pointer;
function __gss_c_ma_auth_targ_anon_oid_desc: Pointer;
function __gss_c_ma_deleg_cred_oid_desc: Pointer;
function __gss_c_ma_integ_prot_oid_desc: Pointer;
function __gss_c_ma_conf_prot_oid_desc: Pointer;
function __gss_c_ma_mic_oid_desc: Pointer;
function __gss_c_ma_wrap_oid_desc: Pointer;
function __gss_c_ma_prot_ready_oid_desc: Pointer;
function __gss_c_ma_replay_det_oid_desc: Pointer;
function __gss_c_ma_oos_det_oid_desc: Pointer;
function __gss_c_ma_cbindings_oid_desc: Pointer;
function __gss_c_ma_pfs_oid_desc: Pointer;
function __gss_c_ma_compress_oid_desc: Pointer;
function __gss_c_ma_ctx_trans_oid_desc: Pointer;
function __gss_c_attr_local_login_user: Pointer;


// ===== External functions =====

const
  libGSS = '/System/Library/Frameworks/GSS.framework/GSS';
function gss_accept_sec_context(minor_status: POM_uint32;
  context_handle: Pgss_ctx_id_t; acceptor_cred_handle: gss_cred_id_t;
  input_token: gss_buffer_t; input_chan_bindings: gss_channel_bindings_t;
  src_name: Pgss_name_t; mech_type: Pgss_OID; output_token: gss_buffer_t;
  ret_flags: POM_uint32; time_rec: POM_uint32;
  delegated_cred_handle: Pgss_cred_id_t): OM_uint32; cdecl;
  external libGSS name _PU + 'gss_accept_sec_context';
function gss_acquire_cred(minor_status: POM_uint32; desired_name: gss_name_t;
  time_req: OM_uint32; desired_mechs: gss_OID_set; cred_usage: gss_cred_usage_t;
  output_cred_handle: Pgss_cred_id_t; actual_mechs: Pgss_OID_set;
  time_rec: POM_uint32): OM_uint32; cdecl;
  external libGSS name _PU + 'gss_acquire_cred';
function gss_acquire_cred_with_password(minor_status: POM_uint32;
  desired_name: gss_name_t; password: gss_buffer_t; time_req: OM_uint32;
  desired_mechs: gss_OID_set; cred_usage: gss_cred_usage_t;
  output_cred_handle: Pgss_cred_id_t; actual_mechs: Pgss_OID_set;
  time_rec: POM_uint32): OM_uint32; cdecl;
  external libGSS name _PU + 'gss_acquire_cred_with_password';
function gss_add_buffer_set_member(minor_status: POM_uint32;
  member_buffer: gss_buffer_t; buffer_set: Pgss_buffer_set_t): OM_uint32; cdecl;
  external libGSS name _PU + 'gss_add_buffer_set_member';
function gss_add_cred(minor_status: POM_uint32;
  input_cred_handle: gss_cred_id_t; desired_name: gss_name_t;
  desired_mech: gss_OID; cred_usage: gss_cred_usage_t;
  initiator_time_req: OM_uint32; acceptor_time_req: OM_uint32;
  output_cred_handle: Pgss_cred_id_t; actual_mechs: Pgss_OID_set;
  initiator_time_rec: POM_uint32; acceptor_time_rec: POM_uint32): OM_uint32;
  cdecl; external libGSS name _PU + 'gss_add_cred';
function gss_add_oid_set_member(minor_status: POM_uint32;
  member_oid: gss_const_OID; oid_set: Pgss_OID_set): OM_uint32; cdecl;
  external libGSS name _PU + 'gss_add_oid_set_member';
function gss_canonicalize_name(minor_status: POM_uint32; input_name: gss_name_t;
  mech_type: gss_OID; output_name: Pgss_name_t): OM_uint32; cdecl;
  external libGSS name _PU + 'gss_canonicalize_name';
function gss_compare_name(minor_status: POM_uint32; name1_arg: gss_name_t;
  name2_arg: gss_name_t; name_equal: PInteger): OM_uint32; cdecl;
  external libGSS name _PU + 'gss_compare_name';
function gss_context_time(minor_status: POM_uint32;
  context_handle: gss_ctx_id_t; time_rec: POM_uint32): OM_uint32; cdecl;
  external libGSS name _PU + 'gss_context_time';
function gss_create_empty_buffer_set(minor_status: POM_uint32;
  buffer_set: Pgss_buffer_set_t): OM_uint32; cdecl;
  external libGSS name _PU + 'gss_create_empty_buffer_set';
function gss_create_empty_oid_set(minor_status: POM_uint32;
  oid_set: Pgss_OID_set): OM_uint32; cdecl;
  external libGSS name _PU + 'gss_create_empty_oid_set';
function gss_decapsulate_token(input_token: gss_const_buffer_t;
  oid: gss_const_OID; output_token: gss_buffer_t): OM_uint32; cdecl;
  external libGSS name _PU + 'gss_decapsulate_token';
function gss_delete_sec_context(minor_status: POM_uint32;
  context_handle: Pgss_ctx_id_t; output_token: gss_buffer_t): OM_uint32; cdecl;
  external libGSS name _PU + 'gss_delete_sec_context';
function gss_destroy_cred(min_stat: POM_uint32; cred_handle: Pgss_cred_id_t)
  : OM_uint32; cdecl; external libGSS name _PU + 'gss_destroy_cred';
function gss_display_mech_attr(minor_status: POM_uint32;
  mech_attr: gss_const_OID; name: gss_buffer_t; short_desc: gss_buffer_t;
  long_desc: gss_buffer_t): OM_uint32; cdecl;
  external libGSS name _PU + 'gss_display_mech_attr';
function gss_display_name(minor_status: POM_uint32; input_name: gss_name_t;
  output_name_buffer: gss_buffer_t; output_name_type: Pgss_OID): OM_uint32;
  cdecl; external libGSS name _PU + 'gss_display_name';
function gss_display_status(minor_status: POM_uint32; status_value: OM_uint32;
  status_type: Integer; mech_type: gss_OID; message_content: POM_uint32;
  status_string: gss_buffer_t): OM_uint32; cdecl;
  external libGSS name _PU + 'gss_display_status';
function gss_duplicate_name(minor_status: POM_uint32; src_name: gss_name_t;
  dest_name: Pgss_name_t): OM_uint32; cdecl;
  external libGSS name _PU + 'gss_duplicate_name';
function gss_duplicate_oid(minor_status: POM_uint32; src_oid: gss_OID;
  dest_oid: Pgss_OID): OM_uint32; cdecl;
  external libGSS name _PU + 'gss_duplicate_oid';
function gss_encapsulate_token(input_token: gss_const_buffer_t;
  oid: gss_const_OID; output_token: gss_buffer_t): OM_uint32; cdecl;
  external libGSS name _PU + 'gss_encapsulate_token';
function gss_export_cred(minor_status: POM_uint32; cred_handle: gss_cred_id_t;
  token: gss_buffer_t): OM_uint32; cdecl;
  external libGSS name _PU + 'gss_export_cred';
function gss_export_name(minor_status: POM_uint32; input_name: gss_name_t;
  exported_name: gss_buffer_t): OM_uint32; cdecl;
  external libGSS name _PU + 'gss_export_name';
function gss_export_sec_context(minor_status: POM_uint32;
  context_handle: Pgss_ctx_id_t; interprocess_token: gss_buffer_t): OM_uint32;
  cdecl; external libGSS name _PU + 'gss_export_sec_context';
function gss_get_mic(minor_status: POM_uint32; context_handle: gss_ctx_id_t;
  qop_req: gss_qop_t; message_buffer: gss_buffer_t; message_token: gss_buffer_t)
  : OM_uint32; cdecl; external libGSS name _PU + 'gss_get_mic';
function gss_import_cred(minor_status: POM_uint32; token: gss_buffer_t;
  cred_handle: Pgss_cred_id_t): OM_uint32; cdecl;
  external libGSS name _PU + 'gss_import_cred';
function gss_import_name(minor_status: POM_uint32;
  input_name_buffer: gss_buffer_t; input_name_type: gss_const_OID;
  output_name: Pgss_name_t): OM_uint32; cdecl;
  external libGSS name _PU + 'gss_import_name';
function gss_import_sec_context(minor_status: POM_uint32;
  interprocess_token: gss_buffer_t; context_handle: Pgss_ctx_id_t): OM_uint32;
  cdecl; external libGSS name _PU + 'gss_import_sec_context';
function gss_indicate_mechs(minor_status: POM_uint32; mech_set: Pgss_OID_set)
  : OM_uint32; cdecl; external libGSS name _PU + 'gss_indicate_mechs';
function gss_indicate_mechs_by_attrs(minor_status: POM_uint32;
  desired_mech_attrs: gss_const_OID_set; except_mech_attrs: gss_const_OID_set;
  critical_mech_attrs: gss_const_OID_set; mechs: Pgss_OID_set): OM_uint32;
  cdecl; external libGSS name _PU + 'gss_indicate_mechs_by_attrs';
function gss_init_sec_context(minor_status: POM_uint32;
  initiator_cred_handle: gss_cred_id_t; context_handle: Pgss_ctx_id_t;
  target_name: gss_name_t; input_mech_type: gss_OID; req_flags: OM_uint32;
  time_req: OM_uint32; input_chan_bindings: gss_channel_bindings_t;
  input_token: gss_buffer_t; actual_mech_type: Pgss_OID;
  output_token: gss_buffer_t; ret_flags: POM_uint32; time_rec: POM_uint32)
  : OM_uint32; cdecl; external libGSS name _PU + 'gss_init_sec_context';
function gss_inquire_attrs_for_mech(minor_status: POM_uint32;
  mech: gss_const_OID; mech_attr: Pgss_OID_set; known_mech_attrs: Pgss_OID_set)
  : OM_uint32; cdecl; external libGSS name _PU + 'gss_inquire_attrs_for_mech';
function gss_inquire_context(minor_status: POM_uint32;
  context_handle: gss_ctx_id_t; src_name: Pgss_name_t; targ_name: Pgss_name_t;
  lifetime_rec: POM_uint32; mech_type: Pgss_OID; ctx_flags: POM_uint32;
  locally_initiated: PInteger; xopen: PInteger): OM_uint32; cdecl;
  external libGSS name _PU + 'gss_inquire_context';
function gss_inquire_cred(minor_status: POM_uint32; cred_handle: gss_cred_id_t;
  name_ret: Pgss_name_t; lifetime: POM_uint32; cred_usage: Pgss_cred_usage_t;
  mechanisms: Pgss_OID_set): OM_uint32; cdecl;
  external libGSS name _PU + 'gss_inquire_cred';
function gss_inquire_cred_by_mech(minor_status: POM_uint32;
  cred_handle: gss_cred_id_t; mech_type: gss_OID; cred_name: Pgss_name_t;
  initiator_lifetime: POM_uint32; acceptor_lifetime: POM_uint32;
  cred_usage: Pgss_cred_usage_t): OM_uint32; cdecl;
  external libGSS name _PU + 'gss_inquire_cred_by_mech';
function gss_inquire_cred_by_oid(minor_status: POM_uint32;
  cred_handle: gss_cred_id_t; desired_object: gss_OID;
  data_set: Pgss_buffer_set_t): OM_uint32; cdecl;
  external libGSS name _PU + 'gss_inquire_cred_by_oid';
function gss_inquire_mech_for_saslname(minor_status: POM_uint32;
  sasl_mech_name: gss_buffer_t; mech_type: Pgss_OID): OM_uint32; cdecl;
  external libGSS name _PU + 'gss_inquire_mech_for_saslname';
function gss_inquire_mechs_for_name(minor_status: POM_uint32;
  input_name: gss_name_t; mech_types: Pgss_OID_set): OM_uint32; cdecl;
  external libGSS name _PU + 'gss_inquire_mechs_for_name';
function gss_inquire_name(minor_status: POM_uint32; input_name: gss_name_t;
  name_is_MN: PInteger; MN_mech: Pgss_OID; attrs: Pgss_buffer_set_t): OM_uint32;
  cdecl; external libGSS name _PU + 'gss_inquire_name';
function gss_inquire_names_for_mech(minor_status: POM_uint32;
  mechanism: gss_const_OID; name_types: Pgss_OID_set): OM_uint32; cdecl;
  external libGSS name _PU + 'gss_inquire_names_for_mech';
function gss_inquire_saslname_for_mech(minor_status: POM_uint32;
  desired_mech: gss_OID; sasl_mech_name: gss_buffer_t; mech_name: gss_buffer_t;
  mech_description: gss_buffer_t): OM_uint32; cdecl;
  external libGSS name _PU + 'gss_inquire_saslname_for_mech';
function gss_inquire_sec_context_by_oid(minor_status: POM_uint32;
  context_handle: gss_ctx_id_t; desired_object: gss_OID;
  data_set: Pgss_buffer_set_t): OM_uint32; cdecl;
  external libGSS name _PU + 'gss_inquire_sec_context_by_oid';
function gss_iter_creds(min_stat: POM_uint32; flags: OM_uint32;
  mech: gss_const_OID; useriter: TGSSUseriter): OM_uint32; cdecl;
  external libGSS name _PU + 'gss_iter_creds';
function gss_iter_creds_f(min_stat: POM_uint32; flags: OM_uint32;
  mech: gss_const_OID; userctx: Pointer; useriter: TGSSUseriter1): OM_uint32;
  cdecl; external libGSS name _PU + 'gss_iter_creds_f';
function gss_krb5_ccache_name(minor_status: POM_uint32; name: MarshaledAString;
  out_name: MarshaledAString): OM_uint32; cdecl;
  external libGSS name _PU + 'gss_krb5_ccache_name';
function gss_krb5_copy_ccache(minor_status: POM_uint32; cred: gss_cred_id_t;
  out : Pointer): OM_uint32; cdecl;
  external libGSS name _PU + 'gss_krb5_copy_ccache';
function gss_krb5_export_lucid_sec_context(minor_status: POM_uint32;
  context_handle: Pgss_ctx_id_t; version: OM_uint32; rctx: Pointer): OM_uint32;
  cdecl; external libGSS name _PU + 'gss_krb5_export_lucid_sec_context';
function gss_krb5_free_lucid_sec_context(minor_status: POM_uint32; c: Pointer)
  : OM_uint32; cdecl; external libGSS name _PU +
  'gss_krb5_free_lucid_sec_context';
function gss_krb5_set_allowable_enctypes(minor_status: POM_uint32;
  cred: gss_cred_id_t; num_enctypes: OM_uint32; enctypes: PLongInt): OM_uint32;
  cdecl; external libGSS name _PU + 'gss_krb5_set_allowable_enctypes';
function gss_oid_equal(a: gss_const_OID; b: gss_const_OID): Integer; cdecl;
  external libGSS name _PU + 'gss_oid_equal';
function gss_oid_to_str(minor_status: POM_uint32; oid: gss_OID;
  oid_str: gss_buffer_t): OM_uint32; cdecl;
  external libGSS name _PU + 'gss_oid_to_str';
function gss_process_context_token(minor_status: POM_uint32;
  context_handle: gss_ctx_id_t; token_buffer: gss_buffer_t): OM_uint32; cdecl;
  external libGSS name _PU + 'gss_process_context_token';
function gss_pseudo_random(minor_status: POM_uint32; context: gss_ctx_id_t;
  prf_key: Integer; prf_in: gss_buffer_t; desired_output_len: Integer;
  prf_out: gss_buffer_t): OM_uint32; cdecl;
  external libGSS name _PU + 'gss_pseudo_random';
function gss_release_buffer(minor_status: POM_uint32; buffer: gss_buffer_t)
  : OM_uint32; cdecl; external libGSS name _PU + 'gss_release_buffer';
function gss_release_buffer_set(minor_status: POM_uint32;
  buffer_set: Pgss_buffer_set_t): OM_uint32; cdecl;
  external libGSS name _PU + 'gss_release_buffer_set';
function gss_release_cred(minor_status: POM_uint32; cred_handle: Pgss_cred_id_t)
  : OM_uint32; cdecl; external libGSS name _PU + 'gss_release_cred';
function gss_release_name(minor_status: POM_uint32; input_name: Pgss_name_t)
  : OM_uint32; cdecl; external libGSS name _PU + 'gss_release_name';
function gss_release_oid(minor_status: POM_uint32; oid: Pgss_OID): OM_uint32;
  cdecl; external libGSS name _PU + 'gss_release_oid';
function gss_release_oid_set(minor_status: POM_uint32; &set: Pgss_OID_set)
  : OM_uint32; cdecl; external libGSS name _PU + 'gss_release_oid_set';
function gss_seal(minor_status: POM_uint32; context_handle: gss_ctx_id_t;
  conf_req_flag: Integer; qop_req: Integer; input_message_buffer: gss_buffer_t;
  conf_state: PInteger; output_message_buffer: gss_buffer_t): OM_uint32; cdecl;
  external libGSS name _PU + 'gss_seal';
function gss_set_cred_option(minor_status: POM_uint32;
  cred_handle: Pgss_cred_id_t; &object: gss_OID; value: gss_buffer_t)
  : OM_uint32; cdecl; external libGSS name _PU + 'gss_set_cred_option';
function gss_set_sec_context_option(minor_status: POM_uint32;
  context_handle: Pgss_ctx_id_t; &object: gss_OID; value: gss_buffer_t)
  : OM_uint32; cdecl; external libGSS name _PU + 'gss_set_sec_context_option';
function gss_sign(minor_status: POM_uint32; context_handle: gss_ctx_id_t;
  qop_req: Integer; message_buffer: gss_buffer_t; message_token: gss_buffer_t)
  : OM_uint32; cdecl; external libGSS name _PU + 'gss_sign';
function gss_test_oid_set_member(minor_status: POM_uint32;
  member: gss_const_OID; &set: gss_OID_set; present: PInteger): OM_uint32;
  cdecl; external libGSS name _PU + 'gss_test_oid_set_member';
function gss_unseal(minor_status: POM_uint32; context_handle: gss_ctx_id_t;
  input_message_buffer: gss_buffer_t; output_message_buffer: gss_buffer_t;
  conf_state: PInteger; qop_state: PInteger): OM_uint32; cdecl;
  external libGSS name _PU + 'gss_unseal';
function gss_unwrap(minor_status: POM_uint32; context_handle: gss_ctx_id_t;
  input_message_buffer: gss_buffer_t; output_message_buffer: gss_buffer_t;
  conf_state: PInteger; qop_state: Pgss_qop_t): OM_uint32; cdecl;
  external libGSS name _PU + 'gss_unwrap';
function gss_userok(name: gss_name_t; user: MarshaledAString): Integer; cdecl;
  external libGSS name _PU + 'gss_userok';
function gss_verify(minor_status: POM_uint32; context_handle: gss_ctx_id_t;
  message_buffer: gss_buffer_t; token_buffer: gss_buffer_t; qop_state: PInteger)
  : OM_uint32; cdecl; external libGSS name _PU + 'gss_verify';
function gss_verify_mic(minor_status: POM_uint32; context_handle: gss_ctx_id_t;
  message_buffer: gss_buffer_t; token_buffer: gss_buffer_t;
  qop_state: Pgss_qop_t): OM_uint32; cdecl;
  external libGSS name _PU + 'gss_verify_mic';
function gss_wrap(minor_status: POM_uint32; context_handle: gss_ctx_id_t;
  conf_req_flag: Integer; qop_req: gss_qop_t;
  input_message_buffer: gss_buffer_t; conf_state: PInteger;
  output_message_buffer: gss_buffer_t): OM_uint32; cdecl;
  external libGSS name _PU + 'gss_wrap';
function gss_wrap_size_limit(minor_status: POM_uint32;
  context_handle: gss_ctx_id_t; conf_req_flag: Integer; qop_req: gss_qop_t;
  req_output_size: OM_uint32; max_input_size: POM_uint32): OM_uint32; cdecl;
  external libGSS name _PU + 'gss_wrap_size_limit';
function gsskrb5_extract_authz_data_from_sec_context(minor_status: POM_uint32;
  context_handle: gss_ctx_id_t; ad_type: Integer; ad_data: gss_buffer_t)
  : OM_uint32; cdecl; external libGSS name _PU +
  'gsskrb5_extract_authz_data_from_sec_context';
function gsskrb5_register_acceptor_identity(identity: MarshaledAString)
  : OM_uint32; cdecl; external libGSS name _PU +
  'gsskrb5_register_acceptor_identity';
function krb5_gss_register_acceptor_identity(identity: MarshaledAString)
  : OM_uint32; cdecl; external libGSS name _PU +
  'krb5_gss_register_acceptor_identity';
function GSSCreateCredentialFromUUID(uuid: CFUUIDRef): gss_cred_id_t; cdecl;
  external libGSS name _PU + 'GSSCreateCredentialFromUUID';
function GSSCreateError(mech: gss_const_OID; major_status: OM_uint32;
  minor_status: OM_uint32): CFErrorRef; cdecl;
  external libGSS name _PU + 'GSSCreateError';
function GSSCreateName(name: CFTypeRef; name_type: gss_const_OID;
  error: PCFErrorRef): gss_name_t; cdecl;
  external libGSS name _PU + 'GSSCreateName';
function GSSCredentialCopyName(cred: gss_cred_id_t): gss_name_t; cdecl;
  external libGSS name _PU + 'GSSCredentialCopyName';
function GSSCredentialCopyUUID(credential: gss_cred_id_t): CFUUIDRef; cdecl;
  external libGSS name _PU + 'GSSCredentialCopyUUID';
function GSSCredentialGetLifetime(cred: gss_cred_id_t): OM_uint32; cdecl;
  external libGSS name _PU + 'GSSCredentialGetLifetime';
function GSSNameCreateDisplayString(name: gss_name_t): CFStringRef; cdecl;
  external libGSS name _PU + 'GSSNameCreateDisplayString';
function gss_aapl_change_password(name: gss_name_t; mech: gss_const_OID;
  attributes: CFDictionaryRef; error: PCFErrorRef): OM_uint32; cdecl;
  external libGSS name _PU + 'gss_aapl_change_password';
function gss_aapl_initial_cred(desired_name: gss_name_t;
  desired_mech: gss_const_OID; attributes: CFDictionaryRef;
  output_cred_handle: Pgss_cred_id_t; error: PCFErrorRef): OM_uint32; cdecl;
  external libGSS name _PU + 'gss_aapl_initial_cred';

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  GSSModule: THandle;

{$ENDIF IOS}

function __gss_krb5_copy_ccache_x_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS, '__gss_krb5_copy_ccache_x_oid_desc');
end;

function __gss_krb5_get_tkt_flags_x_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS, '__gss_krb5_get_tkt_flags_x_oid_desc');
end;

function __gss_krb5_extract_authz_data_from_sec_context_x_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS,
    '__gss_krb5_extract_authz_data_from_sec_context_x_oid_desc');
end;

function __gss_krb5_compat_des3_mic_x_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS, '__gss_krb5_compat_des3_mic_x_oid_desc');
end;

function __gss_krb5_register_acceptor_identity_x_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS,
    '__gss_krb5_register_acceptor_identity_x_oid_desc');
end;

function __gss_krb5_export_lucid_context_x_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS,
    '__gss_krb5_export_lucid_context_x_oid_desc');
end;

function __gss_krb5_export_lucid_context_v1_x_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS,
    '__gss_krb5_export_lucid_context_v1_x_oid_desc');
end;

function __gss_krb5_set_dns_canonicalize_x_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS,
    '__gss_krb5_set_dns_canonicalize_x_oid_desc');
end;

function __gss_krb5_get_subkey_x_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS, '__gss_krb5_get_subkey_x_oid_desc');
end;

function __gss_krb5_get_initiator_subkey_x_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS,
    '__gss_krb5_get_initiator_subkey_x_oid_desc');
end;

function __gss_krb5_get_acceptor_subkey_x_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS,
    '__gss_krb5_get_acceptor_subkey_x_oid_desc');
end;

function __gss_krb5_send_to_kdc_x_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS, '__gss_krb5_send_to_kdc_x_oid_desc');
end;

function __gss_krb5_get_authtime_x_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS, '__gss_krb5_get_authtime_x_oid_desc');
end;

function __gss_krb5_get_service_keyblock_x_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS,
    '__gss_krb5_get_service_keyblock_x_oid_desc');
end;

function __gss_krb5_set_allowable_enctypes_x_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS,
    '__gss_krb5_set_allowable_enctypes_x_oid_desc');
end;

function __gss_krb5_set_default_realm_x_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS,
    '__gss_krb5_set_default_realm_x_oid_desc');
end;

function __gss_krb5_ccache_name_x_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS, '__gss_krb5_ccache_name_x_oid_desc');
end;

function __gss_krb5_set_time_offset_x_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS, '__gss_krb5_set_time_offset_x_oid_desc');
end;

function __gss_krb5_get_time_offset_x_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS, '__gss_krb5_get_time_offset_x_oid_desc');
end;

function __gss_krb5_plugin_register_x_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS, '__gss_krb5_plugin_register_x_oid_desc');
end;

function __gss_ntlm_get_session_key_x_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS, '__gss_ntlm_get_session_key_x_oid_desc');
end;

function __gss_c_nt_ntlm_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS, '__gss_c_nt_ntlm_oid_desc');
end;

function __gss_c_nt_dn_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS, '__gss_c_nt_dn_oid_desc');
end;

function __gss_krb5_nt_principal_name_referral_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS,
    '__gss_krb5_nt_principal_name_referral_oid_desc');
end;

function __gss_c_ntlm_guest_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS, '__gss_c_ntlm_guest_oid_desc');
end;

function __gss_c_ntlm_v1_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS, '__gss_c_ntlm_v1_oid_desc');
end;

function __gss_c_ntlm_v2_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS, '__gss_c_ntlm_v2_oid_desc');
end;

function __gss_c_ntlm_session_key_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS, '__gss_c_ntlm_session_key_oid_desc');
end;

function __gss_c_ntlm_force_v1_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS, '__gss_c_ntlm_force_v1_oid_desc');
end;

function __gss_krb5_cred_no_ci_flags_x_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS, '__gss_krb5_cred_no_ci_flags_x_oid_desc');
end;

function __gss_c_nt_uuid_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS, '__gss_c_nt_uuid_oid_desc');
end;

function __gss_c_ntlm_support_channelbindings_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS,
    '__gss_c_ntlm_support_channelbindings_oid_desc');
end;

function __gss_c_ntlm_support_lm2_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS, '__gss_c_ntlm_support_lm2_oid_desc');
end;

function __gss_krb5_import_cred_x_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS, '__gss_krb5_import_cred_x_oid_desc');
end;

function __gss_c_ntlm_reset_keys_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS, '__gss_c_ntlm_reset_keys_oid_desc');
end;

function __gss_c_cred_diag_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS, '__gss_c_cred_diag_oid_desc');
end;

function __gss_c_cred_validate_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS, '__gss_c_cred_validate_oid_desc');
end;

function __gss_c_cred_set_default_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS, '__gss_c_cred_set_default_oid_desc');
end;

function __gss_c_cred_get_default_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS, '__gss_c_cred_get_default_oid_desc');
end;

function __gss_c_cred_renew_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS, '__gss_c_cred_renew_oid_desc');
end;

function __gss_c_ctx_pfs_x_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS, '__gss_c_ctx_pfs_x_oid_desc');
end;

function __gss_c_ma_sasl_mech_name_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS, '__gss_c_ma_sasl_mech_name_oid_desc');
end;

function __gss_c_ma_mech_name_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS, '__gss_c_ma_mech_name_oid_desc');
end;

function __gss_c_ma_mech_description_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS, '__gss_c_ma_mech_description_oid_desc');
end;

function __gss_c_cred_password_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS, '__gss_c_cred_password_oid_desc');
end;

function __gss_c_cred_certificate_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS, '__gss_c_cred_certificate_oid_desc');
end;

function __gss_c_cred_secidentity_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS, '__gss_c_cred_secidentity_oid_desc');
end;

function __gss_c_cred_heimbase_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS, '__gss_c_cred_heimbase_oid_desc');
end;

function __gss_sasl_digest_md5_mechanism_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS,
    '__gss_sasl_digest_md5_mechanism_oid_desc');
end;

function __gss_netlogon_mechanism_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS, '__gss_netlogon_mechanism_oid_desc');
end;

function __gss_appl_lkdc_supported_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS, '__gss_appl_lkdc_supported_oid_desc');
end;

function __gss_netlogon_set_session_key_x_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS,
    '__gss_netlogon_set_session_key_x_oid_desc');
end;

function __gss_netlogon_set_sign_algorithm_x_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS,
    '__gss_netlogon_set_sign_algorithm_x_oid_desc');
end;

function __gss_netlogon_nt_netbios_dns_name_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS,
    '__gss_netlogon_nt_netbios_dns_name_oid_desc');
end;

function __gss_c_inq_win2k_pac_x_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS, '__gss_c_inq_win2k_pac_x_oid_desc');
end;

function __gss_c_inq_sspi_session_key_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS, '__gss_c_inq_sspi_session_key_oid_desc');
end;

function __gss_krb5_mechanism_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS, '__gss_krb5_mechanism_oid_desc');
end;

function __gss_ntlm_mechanism_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS, '__gss_ntlm_mechanism_oid_desc');
end;

function __gss_iakerb_mechanism_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS, '__gss_iakerb_mechanism_oid_desc');
end;

function __gss_pku2u_mechanism_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS, '__gss_pku2u_mechanism_oid_desc');
end;

function __gss_spnego_mechanism_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS, '__gss_spnego_mechanism_oid_desc');
end;

function __gss_scram_mechanism_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS, '__gss_scram_mechanism_oid_desc');
end;

function __gss_c_nt_user_name_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS, '__gss_c_nt_user_name_oid_desc');
end;

function __gss_c_nt_machine_uid_name_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS, '__gss_c_nt_machine_uid_name_oid_desc');
end;

function __gss_c_nt_string_uid_name_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS, '__gss_c_nt_string_uid_name_oid_desc');
end;

function __gss_c_nt_hostbased_service_x_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS,
    '__gss_c_nt_hostbased_service_x_oid_desc');
end;

function __gss_c_nt_hostbased_service_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS, '__gss_c_nt_hostbased_service_oid_desc');
end;

function __gss_c_nt_anonymous_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS, '__gss_c_nt_anonymous_oid_desc');
end;

function __gss_c_nt_export_name_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS, '__gss_c_nt_export_name_oid_desc');
end;

function __gss_krb5_nt_principal_name_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS, '__gss_krb5_nt_principal_name_oid_desc');
end;

function __gss_krb5_nt_principal_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS, '__gss_krb5_nt_principal_oid_desc');
end;

function __gss_c_peer_has_updated_spnego_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS,
    '__gss_c_peer_has_updated_spnego_oid_desc');
end;

function __gss_c_ma_mech_concrete_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS, '__gss_c_ma_mech_concrete_oid_desc');
end;

function __gss_c_ma_mech_pseudo_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS, '__gss_c_ma_mech_pseudo_oid_desc');
end;

function __gss_c_ma_mech_composite_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS, '__gss_c_ma_mech_composite_oid_desc');
end;

function __gss_c_ma_mech_nego_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS, '__gss_c_ma_mech_nego_oid_desc');
end;

function __gss_c_ma_mech_glue_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS, '__gss_c_ma_mech_glue_oid_desc');
end;

function __gss_c_ma_not_mech_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS, '__gss_c_ma_not_mech_oid_desc');
end;

function __gss_c_ma_deprecated_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS, '__gss_c_ma_deprecated_oid_desc');
end;

function __gss_c_ma_not_dflt_mech_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS, '__gss_c_ma_not_dflt_mech_oid_desc');
end;

function __gss_c_ma_itok_framed_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS, '__gss_c_ma_itok_framed_oid_desc');
end;

function __gss_c_ma_auth_init_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS, '__gss_c_ma_auth_init_oid_desc');
end;

function __gss_c_ma_auth_targ_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS, '__gss_c_ma_auth_targ_oid_desc');
end;

function __gss_c_ma_auth_init_init_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS, '__gss_c_ma_auth_init_init_oid_desc');
end;

function __gss_c_ma_auth_targ_init_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS, '__gss_c_ma_auth_targ_init_oid_desc');
end;

function __gss_c_ma_auth_init_anon_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS, '__gss_c_ma_auth_init_anon_oid_desc');
end;

function __gss_c_ma_auth_targ_anon_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS, '__gss_c_ma_auth_targ_anon_oid_desc');
end;

function __gss_c_ma_deleg_cred_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS, '__gss_c_ma_deleg_cred_oid_desc');
end;

function __gss_c_ma_integ_prot_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS, '__gss_c_ma_integ_prot_oid_desc');
end;

function __gss_c_ma_conf_prot_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS, '__gss_c_ma_conf_prot_oid_desc');
end;

function __gss_c_ma_mic_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS, '__gss_c_ma_mic_oid_desc');
end;

function __gss_c_ma_wrap_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS, '__gss_c_ma_wrap_oid_desc');
end;

function __gss_c_ma_prot_ready_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS, '__gss_c_ma_prot_ready_oid_desc');
end;

function __gss_c_ma_replay_det_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS, '__gss_c_ma_replay_det_oid_desc');
end;

function __gss_c_ma_oos_det_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS, '__gss_c_ma_oos_det_oid_desc');
end;

function __gss_c_ma_cbindings_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS, '__gss_c_ma_cbindings_oid_desc');
end;

function __gss_c_ma_pfs_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS, '__gss_c_ma_pfs_oid_desc');
end;

function __gss_c_ma_compress_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS, '__gss_c_ma_compress_oid_desc');
end;

function __gss_c_ma_ctx_trans_oid_desc: Pointer;
begin
  Result := CocoaPointerConst(libGSS, '__gss_c_ma_ctx_trans_oid_desc');
end;

function __gss_c_attr_local_login_user: Pointer;
begin
  Result := CocoaPointerConst(libGSS, '__gss_c_attr_local_login_user');
end;

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

GSSModule := dlopen(MarshaledAString(libGSS), RTLD_LAZY);

finalization

dlclose(GSSModule);
{$ENDIF IOS}

end.
