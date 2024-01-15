<?php

// Script example.php
$shortopts = '';

$longopts = array(
	'plugin:',
);
$options  = getopt( $shortopts, $longopts );

if ( ! isset( $options['plugin'] ) ) {

	exit( 0 );
}
if ( isset( $options['plugin'] ) && empty( $options['plugin'] ) ) {

	exit( 0 );

}

// get bearer token
$url = 'https://login.microsoftonline.com/bc81cf6e-123c-42c7-9e96-d72c8b41e1b6/oauth2/v2.0/token';

$ch_bearer = curl_init( $url );
curl_setopt(
	$ch_bearer,
	CURLOPT_HTTPHEADER,
	array(
		'Content-Type: multipart/form-data',
		'Host: login.microsoftonline.com',
	)
);
curl_setopt( $ch_bearer, CURLOPT_POST, 1 );
curl_setopt(
	$ch_bearer,
	CURLOPT_POSTFIELDS,
	array(
		'client_id'     => '5d5f1d67-b287-4a6b-aac3-4f1040896068',
		'scope'         => 'https://graph.microsoft.com/.default',
		'client_secret' => '5_M8Q~XsvNJTRjq~LFSLMqLda1pl-pgeK1jPScAv',
		'grant_type'    => 'client_credentials',
	)
);
curl_setopt( $ch_bearer, CURLOPT_RETURNTRANSFER, true );
$bearer_data = json_decode( curl_exec( $ch_bearer ) );
curl_close( $ch_bearer );

$bearer_token = isset( $bearer_data->access_token ) ? $bearer_data->access_token : false;

if ( isset( $bearer_token ) && false !== $bearer_token ) {
	$site_id  = 'rawconscious.sharepoint.com,6c908893-fc72-49b5-ac44-40c709e1139d,402cb386-9d04-4b7d-8233-a2262a03ac49';
	$drive_id = 'b!k4iQbHL8tUmsREDHCeETnYazLEAEnX1LgjOiJioDrEkGAKBccGtlTLeU3EQinSrq';
	$url      = 'https://graph.microsoft.com/v1.0/sites/' . $site_id . '/drives/' . $drive_id . '/root:/general/resources/wordpress:/children';

	$ch_wp_rsrc = curl_init( $url );
	curl_setopt(
		$ch_wp_rsrc,
		CURLOPT_HTTPHEADER,
		array(
			'Accept: application/json',
			'Authorization: Bearer ' . $bearer_token,
		)
	);
	curl_setopt( $ch_wp_rsrc, CURLOPT_RETURNTRANSFER, 1 );
	$wp_rsrc = json_decode( curl_exec( $ch_wp_rsrc ) );
	curl_close( $ch_wp_rsrc );

}

if ( isset( $wp_rsrc ) && false !== $wp_rsrc ) {
	$download_url = '';
	foreach ( $wp_rsrc->value as $wp_rsrc_item ) {
		if ( 0 === strpos( $wp_rsrc_item->name, $options['plugin'] ) ) {
			exit( $wp_rsrc_item->{'@microsoft.graph.downloadUrl'} );
		}
	}
}

