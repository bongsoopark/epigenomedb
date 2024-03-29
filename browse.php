<?php
include "./lib/conf.php";
include "./lib/conf_db.php";
include "./lib/common.php";
include "./lib/design.php";
include "./lib/sample.php";

# MySQL connection
$con = new mysqli($DBConf["GENOME_HOST"], $DBConf["GENOME_USER"], $DBConf["GENOME_PASS"], $DBConf["GENOME_DB"]);
if ($con->connect_error) {
	echo("Database Connection Error");
}

$sql = "SELECT genus_name, species_name, strain_name from species;";
$result = $con->query($sql);
$data = array();
while($row = $result->fetch_row()) {
	array_push($data, $row[0]." ".$row[1]." ".$row[2]);
}
$result->free();

$sql = "SELECT assembly_id, db_key from genome;";
$result = $con->query($sql);
$data2 = array();
while($row = $result->fetch_row()) {
	array_push($data2, "<a href='/epigenome/browse/genome/?gid=$row[0]'>".$row[0]." ".$row[1]."</a>");
}
$result->free();

$sql = "SELECT assembly_id, db_key from genome;";
$result = $con->query($sql);
$data3 = array();
while($row = $result->fetch_row()) {
	array_push($data3, "<a href='/epigenome/browse/proteome/?gid=$row[0]'>".$row[0]." ".$row[1]."</a>");
}
$result->free();

$con->close();
####--------------- Template Engine ---------------####
$design = new Design;
$design->loadData("index.dat");
$design->readTemplate("browse.tpl");
$design->parsing(array(
		"DATA" => $data, "DATA_CNT" => count($data), 
		"DATA2" => $data2, "DATA_CNT2" => count($data2),
		"DATA3" => $data3, "DATA_CNT3" => count($data3), "tc" => $tc
		));
$design->display();
####--------------- Template Engine ---------------####
?>
