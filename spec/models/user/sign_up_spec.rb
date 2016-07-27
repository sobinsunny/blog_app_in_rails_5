RSpec.describe User::SignUp, type: :model do
   it 'Succesfully SignUp' do
      expect(build(:sign_up)).to be_valid
   end




end