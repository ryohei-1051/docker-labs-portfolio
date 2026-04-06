<?php
$yourname = "Ryohei Nakao";
$yourstudentnumber = "A01305924";
$image = "docker.jpg";
$uname = php_uname();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title><?php echo $yourname . ' - ' . $yourstudentnumber; ?></title>
</head>
<body>
    <h1><?php echo $yourname . ' - ' . $yourstudentnumber; ?></h1>
    <img src="/<?php echo $image; ?>" alt="Custom lab image" width="400" />
    <div><?php echo $uname; ?></div>
</body>
</html>

