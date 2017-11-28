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

      context 'before date' do
        it 'should decrease quality by 1' do
          normal.update_quality
          expect(item.quality).to eq quality - 1
        end
      end

      context 'on date' do
        let(:sell_in) { 0 }
        it 'should decrease quality by 2' do
          normal.update_quality
          expect(item.quality).to eq quality - 2
        end
      end

      context 'after date' do
        let(:sell_in) { -1 }
        it 'should decrease quality by 2' do
          normal.update_quality
          expect(item.quality).to eq quality - 2
        end
      end

      context 'minimum quality' do
        let(:quality) { 0 }
        it 'quality can not be less than 0' do
          normal.update_quality
          expect(item.quality).to eq 0
        end
      end
    end

    context 'Aged Brie' do
      let(:name) { 'Aged Brie' }
      let(:aged_brie) { GildedRose.new([item]) }

      it 'should decrease sell_in by 1' do
        aged_brie.update_quality
        expect(item.sell_in).to eq sell_in - 1
      end

      context 'before date' do
        it 'should increase quality by 1' do
          aged_brie.update_quality
          expect(item.quality).to eq quality + 1
        end
      end

      context 'on date' do
        let(:sell_in) { 0 }
        it 'should increase quality by 2' do
          aged_brie.update_quality
          expect(item.quality).to eq quality + 2
        end
      end

      context 'after date' do
        let(:sell_in) { -1 }
        it 'should increase quality by 2' do
          aged_brie.update_quality
          expect(item.quality).to eq quality + 2
        end
      end

      context 'maximum quality' do
        let(:quality) { 50 }
        it 'quality can not be more than 50' do
          aged_brie.update_quality
          expect(item.quality).to eq 50
        end
      end
    end

    context 'Sulfuras' do
      let(:name) { 'Sulfuras, Hand of Ragnaros' }
      let(:quality) { 40 }
      let(:sulfuras) { GildedRose.new([item]) }

      it 'sell_in should stay the same' do
        sulfuras.update_quality
        expect(item.sell_in).to eq sell_in
      end

      context 'before date' do
        it 'quality should stay the same' do
          sulfuras.update_quality
          expect(item.quality).to eq quality
        end
      end
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