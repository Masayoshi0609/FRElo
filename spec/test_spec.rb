#Rspecのテスト記述
describe '四則演算' do
  context '足し算' do
    it '1 + 1は2になる' do
      expect(1 + 1).to eq 2
    end
  end
  context '足し算' do
    it '1 + 1は2になる' do
      expect(1 + 1).to eq 3
    end
  end
end