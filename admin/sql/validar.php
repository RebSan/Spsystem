<?php
class Validar
{
	public static function validateForm($fields)
	{
		foreach ($fields as $index => $value) {
			//eliminar espacios vacios al principio y al final
			$value = trim($value);
			$fields[$index] = $value;
		}
		return $fields;
	}

	public static function validarImagen($file)
	{
		$img_size = $file["size"];
		//validar tama;o de la imagen, 2 MB
     	if($img_size <= 2097152)
     	{
     		$img_type = $file["type"];
	     	if($img_type == "image/jpeg" || $img_type == "image/png" || $img_type == "image/gif")
	    	{
	    		//
	    		$img_temporal = $file["tmp_name"];
	    		//
	    		$img_info = getimagesize($img_temporal);
		    	$img_width = $img_info[0]; 
				$img_height = $img_info[1];
				//codificar un archivo a texto
				$image = file_get_contents($img_temporal);
				//codificar un texto a binario
				return base64_encode($image);
	    	}
	    	else
	    	{
	    		return false;
	    	}
     	}
     	else
     	{
     		return false;
     	}
	}
}
?>