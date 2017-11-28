require './lib/gilded_rose'

describe GildedRose do

  describe '#update_quality' do
    let(:sell_in) { 10 }
    let(:quality) { 10 }
    let(:item) { Item.new(name, sell_in, quality) }

    context 'Normal Item' do
      let(:name) { 'normal' }
      let(:normal) { GildedRose.new([item]) }

      it 'should decrease sell_in by 1' do
        normal.update_quality
        expect(item.sell_in).to eq sell_in - 1
      end
      
    end

    context 'Aged Brie' do

    end

    context 'Sulfuras' do

    end

    context 'Backstage passes' do

    end

    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "foo"
    end
  end

end