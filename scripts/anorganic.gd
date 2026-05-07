extends StaticBody2D

# Tentukan jenis tong ini di Inspector (organik/anorganik/b3)
@export var jenis_tong: String = "organik"

# Fungsi ini akan dipanggil oleh Player saat menekan tombol 'E'
func terima_sampah(sampah_yang_dibawa):
	if sampah_yang_dibawa.jenis_sampah == jenis_tong:
		print("BENAR! Sampah masuk ke tempat yang tepat.")
		
		# Hapus sampah dari tangan player
		sampah_yang_dibawa.queue_free()
		
		# Beri sinyal sukses (bisa tambah skor di sini nanti)
		return true 
	else:
		print("SALAH! Itu bukan tempatnya.")
		# Beri efek slime marah atau suara salah di sini
		return false
