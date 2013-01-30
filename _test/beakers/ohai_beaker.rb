describe "Ohai", :depth => 'shallow' do

  before(:each) do
    @ohai = PageObjects::Ohai.new(@driver)
  end

  it "blah" do
    @ohai.open "http://www.google.com"
  end
end
