function love.load()	

  vassoura = love.graphics.newImage('assets/vasoura.png')
  morcego = love.graphics.newImage('assets/morcego1.png')

  print("test log")

  max = 10
  min = 5
  velocidade = 5

  limitx = 700
  limity = 500

  x = 1
  y = 1

  direita = 1
  baixo = 1

  posMouseX = 0
  posMouseY = 0

  imgAtual = 1

  tempo = 0

end

function love.draw()
    
    love.graphics.draw(vassoura, posMouseX, posMouseY, 83)
    love.graphics.draw(morcego, x, y)

end

function love.update(dt) 
  --print(dt)

  if (x <= limitx and direita == 1) then

    x = x + velocidade

    if (x >= limitx) then
      direita = 0
    end
    velocidade = love.math.random(min, max)
  end

  if (direita == 0) then
    x = x - velocidade

    if (x <= 1) then
      direita = 1
    end
  end

  if (y <= limity and baixo == 1) then

    y = y + velocidade

    if (y >= limity) then
      baixo = 0
    end
  end

  if (baixo == 0) then
    y = y - velocidade

    if (y <= 1) then
      baixo = 1
    end
  end

  tempo = tempo + dt

  if (tempo >= 0.3) then
    alterarImgMorcego()
  end

end

function alterarImgMorcego()

  if(imgAtual == 1) then

    love.graphics.draw(morcego)

    imgAtual = imgAtual+1
    tempo = 0

  end
  
  if (imgAtual == 2) then

    morcego = love.graphics.newImage('assets/morcego2.png')

    love.graphics.draw(morcego)

    imgAtual = imgAtual+1
    tempo = 0
  end

  if (imgAtual == 3) then

    morcego = love.graphics.newImage('assets/morcego3.png')

    love.graphics.draw(morcego)
  
    imgAtual = imgAtual+1
    tempo = 0
  end
  
  if (imgAtual == 4) then

    morcego = love.graphics.newImage('assets/morcego4.png')

    love.graphics.draw(morcego)
    
    imgAtual = imgAtual + 1
    tempo = 0
  end

  if (imgAtual >= 5)then
    
    imgAtual = 1
    tempo = 0
  end
end


function love.mousemoved(x, y, dx, dy)

  posMouseX = x+15
  posMouseY = y-25
end

function love.mousepressed(x, y, button, istouch)
   if button == 1 then
    love.graphics.draw(vassoura, x, y)
   end
end