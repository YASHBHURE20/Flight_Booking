<?php include 'db_connect.php' ?>

<div class="container-fluid">
	<div class="col-lg-12">
		<div class="card">
			<div class="card-header">
				
				
			</div>
			<div class="card-body">
				<table class="table table-bordered" id="flight-list">
					<colgroup>
						<col width="10%">
						<col width="35%">
						<col width="10%">
						<col width="10%">
						<col width="10%">
						<col width="10%">
						<col width="15%">
					</colgroup>
					<thead>
						<tr>
							<th class="text-center">Date</th>
							<th class="text-center">Information</th>
							<th class="text-center">Seats</th>
							<th class="text-center">Booked</th>
							<th class="text-center">Available</th>
							<th class="text-center">Price</th>
							<th class="text-center">Total</th>
						</tr>
					</thead>
					<tbody>
						<?php
						
						$fdate=$_POST['fromdate'];
						$tdate=$_POST['todate'];
						
					
							$airport = $conn->query("SELECT * FROM airport_list ");
							while($row = $airport->fetch_assoc()){
								$aname[$row['id']] = ucwords($row['airport'].', '.$row['location']);
							}
							$qry = $conn->query("SELECT f.*,a.airlines,a.logo_path FROM flight_list f where departure_datetime =$fdate                                 CCCinner join airlines_list a on f.airline_id = a.id  order by id desc");
							while($row = $qry->fetch_assoc()):
								$booked = $conn->query("SELECT * FROM booked_flight where flight_id = ".$row['id'])->num_rows;


						 ?>
						 <tr>
						 <?php
								$total = 0;
								$price = $row['price'];
								$total = $booked * $price;
								
								?>
						
						 	
						 	<td><?php echo date('M d,Y',strtotime($row['date_created'])) ?></td>
						 	<td>
						 		<div class="row">
						 		<div class="col-sm-4">
						 			<img src="../assets/img/<?php echo $row['logo_path'] ?>" alt="" class="btn-rounder badge-pill">
						 		</div>
						 		<div class="col-sm-6">
						 		<p>Airline :<b><?php echo $row['airlines'] ?></b></p>
						 		<p><small>Airline :<b><?php echo $row['airlines'] ?></small></b></p>
						 		<p><small>Location :<b><?php echo $aname[$row['departure_airport_id']].' - '.$aname[$row['arrival_airport_id']] ?></small></b></p>
						 		<p><small>Departure :<b><?php echo date('M d,Y h:i A',strtotime($row['departure_datetime'])) ?></small></b></p>
						 		<p><small>Arrival :<b><?php echo date('M d,Y h:i A',strtotime($row['arrival_datetime'])) ?></small></b></p>
						 		</div>
						 		</div>
						 	</td>
						 	<td class="text-right"><?php echo $row['seats'] ?></td>
						 	<td class="text-right"><?php echo $booked ?></td>
						 	<td class="text-right"><?php echo $row['seats'] - $booked ?></td>
						 	<td class="text-right"><?php echo number_format($row['price'],2) ?></td>
						 	<td class="text-center"><?php echo $total ?></td>
						 			
						 	</td>

						 </tr>

						<?php endwhile; ?>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<style>
	td p {
		margin:unset;
	}
	td img {
	    width: 8vw;
	    height: 12vh;
	}
	td{
		vertical-align: middle !important;
	}
</style>	
