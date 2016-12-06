


<?php
/*
 * use snappy to compress data !
 * https://github.com/kjdev/php-ext-snappy
 * php -d enable_dl=On  php_sdk.php
 */

if (!extension_loaded('snappy')) {
    dl('snappy.so');
}

$post_data = [[
"tm" => 1480042727121,
"stm" => 1480042728943,
    "cs1" => "user:526",
    "p" => "/v2/projects/yYo1XPl1/charts",
    "s" => "bb9aa471-3bc9-455b-b3a1-eeb9e0e9a0e3",
    "u" => "7328beea-ee89-43a0-86cb-48879e90a67d",
    "ai" => "0a1b4118dd954ec3bcc69da5138bdb96",
    "t" => "cstm",
    "d" => "gta.growingio.com",
    "n" => "create_chart",
    "e" => [
        "account_id" => "0a1b4118dd954ec3bcc69da5138bdb96",
        "chart_dimension_count" => 12,
        "chart_id" => 9999,
        "chart_metric_count" => 1,
        "chart_name" => "php dim test",
        "chart_type" => "line"
    ]
  ]];

$json_data = json_encode($post_data);
printf($json_data);
$compress_data = snappy_compress($json_data); // need to compress data !
$headers = array(
    'X-Client-Id:7f8it37dxdt91x4n5cvuvccc1cgaqe22',
    'Content-Type:application/json',
);
$url = "https://api.growingio.com/custom/0a1b4118dd954ec3bcc69da5138bdb96/events";
$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, $url);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($ch, CURLOPT_HEADER,true); 
curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
curl_setopt($ch, CURLOPT_POST, 1);
curl_setopt($ch, CURLOPT_POSTFIELDS, $compress_data);
$output = curl_exec($ch);
curl_close($ch);
print_r($output);

?>