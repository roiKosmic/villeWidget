<?php
function parse ($url,$id) {

		$fileContents= file_get_contents($url);

		$fileContents = str_replace(array("\n", "\r", "\t",), '', $fileContents);

		$fileContents = trim(str_replace('"', "'", $fileContents));
		
		$simpleXml = simplexml_load_string(preg_replace('/(<\?xml[^?]+?)utf-16/i', '$1utf-8',$fileContents));
		$movie = $simpleXml ->addChild('id',(int)$id);
		$json = json_encode($simpleXml);

		return $json;

	}
	
	$vlilleStationId = $_GET["id"];
	$myUrl = "http://vlille.fr/stations/xml-station.aspx?borne=".$vlilleStationId;
	header('Content-Type: application/json');
	echo parse($myUrl,$vlilleStationId);
	
?>