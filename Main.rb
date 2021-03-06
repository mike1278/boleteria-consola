require "./Metodos"
require "rubygems"
require "pg"

#res.each{ |resp| resp["costo"] }

class Compra
	def initialize(op)
		@op = op
	end
	def compra
		puts "Bienvenido a la compra de su boleto, antes de continuar con su compra necesitamos que ingrese su informacion."
		print "Ingrese su nombre: "
		nombre = gets.strip.chomp
		print "Ingrese su apellido: "
		apellido = gets.strip.chomp
		print "CI: "
		cedula = gets.strip.chomp
		while !is_number?(cedula)
			print "Solo se puede ingresar numeros, vuelva a introducir la CI: "
			cedula = gets.strip.chomp
		end
		puts "Fecha de nacimiento, orden yyyy/mm/dd"
		fc = gets.strip.chomp
		print "Genero, Hombre/Mujer o H/M: "
		genero = gets.chomp.strip.downcase
		while !(genero == "hombre" || genero == "h" || genero == "mujer" || genero == "m")
			print "Solo se puede ingresar hombre/mujer o abreviacion como h/m, ingrese de nuevo: "
			genero = gets.chomp.strip.downcase
		end
		@conn = PG::Connection.connect("localhost",5432,"","","Boleteria","postgres","rob170100")
		res = conn.exec_params("select nombre from clientes where nombre=$1",[nombre])
		if res.getvalue(0,0) == nil
			if fc == ""
				@conn.exec_params("insert into clientes('cedula','nombre','apellido','genero') values($1,$2,$3,$4)",[cedula,nombre,apellido,genero])
			else
				#@conn.exec("insert into clientes('cedula','nombre','apellido','fecha_naciemiento','genero')values("cedula",'"nombre"','"apellido"','"genero"')")
			end
		end
		if @op == "1"
			avion()
		elsif @op == "2"
			autobus()
		elsif @op == "3"
			barco()
		end
		@conn.close
	end

	def avion

	end

	def barco

	end

	def autobus

	end
end

class Main
	def inicio()
		begin
			puts "Bienvenido a la boleteria\nQue desea Comprar?\n1)Boleto de avion\n2)Boleto de autobus\n3)Boleto de barco"
			answer = gets.downcase.strip.chomp
			if answer=="1" || answer=="boleto de avion" || answer=="avion"
				compra = Compra.new(1)
				compra.compra()
			elsif answer=="2" || answer=="boleto de autobus" || answer=="autobus"
				compra = Compra.new(2)
			elsif answer=="3" || answer=="boleto de barco" || answer=="barco"
				compra = Compra.new(3)
			else
	 			puts "Opcion incorrecta"
			end
			puts "Desea realizar alguna otra compra?"
			answer = gets.strip.downcase.chomp
		end while answer=="si"
	end
end

main = Main.new()
main.inicio()