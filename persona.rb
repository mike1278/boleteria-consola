class Persona
	def initialize(nombre, apellido, cedula,fecha_nacimiento,genero)
		@nombre = nombre
		@apellido = apellido
		@cedula = cedula
		@fecha_nacimiento = fecha_nacimiento
		@genero = genero
	end
	#metodos para retornar todas las variables
	def nombre()
		puts "#{@nombre}"	
	end
	def apellido()
		puts "#{@apellido}"
	end
	def cedula()
		puts "#{@cedula}"	
	end
	def fecha()
		puts "#{@fecha_nacimiento}"
	end
	def genero()
		puts "#{@genero}"
	end
end