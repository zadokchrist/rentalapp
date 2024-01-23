<?php
// Check if the file path variable is set
if (isset($file_path)) {
    // Set appropriate headers for file download
    header('Content-Description: File Transfer');
    header('Content-Type: application/octet-stream');
    header('Content-Disposition: attachment; filename="' . basename($file_path) . '"');
    header('Expires: 0');
    header('Cache-Control: must-revalidate');
    header('Pragma: public');
    header('Content-Length: ' . filesize($file_path));

    // Read the file and output it to the browser
    readfile($file_path);
    exit;
} else {
    // File path not found
    http_response_code(404);
    echo 'File path not found in the database.';
    exit;
}
?>
