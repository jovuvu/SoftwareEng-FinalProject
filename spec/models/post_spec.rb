require 'spec_helper'

describe Post do
  before do
    @user = FactoryGirl.create(:user)
    @parent = FactoryGirl.create(:post, content: "PARENT", user_id: @user.id)
    @children = Array.new
    for i in 0..5 
      @pst = FactoryGirl.create(:post, content: "CHILD", user_id: @user.id, parent: @parent.id)
      @children.push(@pst.id)
    end
    @parent.children = @children
    @parent.save
  end
  it "should store its children properly" do
    puts "@parent.children: " + @parent.children.inspect  
    expect(@parent.children).to eq @children
  end
end
