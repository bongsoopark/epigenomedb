<?php
include "../../lib/conf.php";
include "../../lib/conf_db.php";
include "../../lib/common.php";
include "../../lib/design.php";
include "../../lib/sample.php";

# MySQL connection
$con = new mysqli($DBConf["GENOME_HOST"], $DBConf["GENOME_USER"], $DBConf["GENOME_PASS"], $DBConf["GENOME_DB"]);
if ($con->connect_error) {
	echo("Database Connection Error");
}

$sql = "SELECT id, genus_name, species_name, strain_name, ncbi_txid, lineage from species where ncbi_txid=$txid;";
$result = $con->query($sql);
$data = $result->fetch_object();
$result->free();

# Update the species access frequency
$sql = "UPDATE species SET frequency=frequency+1 where ncbi_txid=$txid;";
$result = $con->query($sql);

$sql = "SELECT id, assembly_id, db_key from genome where species_id='".$data->id."';";
$result = $con->query($sql);
$data2 = array();
while($row = $result->fetch_object()) {
	$sql2 = "SELECT count(*) from chromosome where genome_id='".$row->id."';";
	$result2 = $con->query($sql2);
	list($row->chromosome) = $result2->fetch_row();
	$result2->free();
	$sql2 = "SELECT count(*) from sequence where genome_id='".$row->id."';";
	$result2 = $con->query($sql2);
	list($row->proteome) = $result2->fetch_row();
	$result2->free();
	$row->proteome = number_format($row->proteome);
	$sql2 = "SELECT count(*) from genome_features where genome_id='".$row->id."';";
	$result2 = $con->query($sql2);
	list($row->reference_features) = $result2->fetch_row();
	$result2->free();
	$row->reference_features = number_format($row->reference_features);
	array_push($data2, $row);
}
$result->free();
$con->close();

####--------------- Template Engine ---------------####
$design = new Design;
$design->loadData("index.dat");
$design->readTemplate("/species_detail.tpl");
$design->parsing(array(
		"DATA" => $data, "DATA_CNT" => count($data), 
		"DATA2" => $data2, "DATA_CNT2" => count($data2), 
		"DATA3" => $data3, "DATA_CNT3" => count($data3), "tc" => $tc
		));
$design->display();
####--------------- Template Engine ---------------####
?>
