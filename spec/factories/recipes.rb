FactoryGirl.define do
  factory :recipe do
    name 'Bolinho de bacalhau'
    cuisine
    food_type
    serves 1
    cooking_time 45
    difficulty 'Médio'
    ingredients '500 gramas de bacalhau; 500 gramas de batata;
                1 ovo; Salsa e cebolinha;
                2 colheres de sopa de farinha;
                5 colheres de azeite; Sal'
    directions 'Dessalgar o bacalhau, cozinhá-lo e desfiar,
                 reserve. Cozinhe as batatas e amasse-as,
                 faça um purê, espere esfriar.
                 Em seguida misture o purê com o bacalhau
                 desfiado, acrescente os outros ingredientes.
                 Faça bolinhas e frite-as em óleo bem quente.'
    picture { File.new("#{Rails.root}/spec/fixtures/bolinho.png") }
    user
  end
end
