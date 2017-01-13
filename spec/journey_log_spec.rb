require 'journey_log'

describe JourneyLog do
  subject(:journey_log) {JourneyLog.new}
    let(:journey) {double :journey}

  describe "#initialization" do
    it "sets the attribute journey_class upon initialization" do
      expect(journey_log.journey_class).to eq nil
    end
  end

  describe "#start" do
    it {is_expected.to respond_to(:start).with(1).argument}

    it "sets the attribute journey_class to an instance of journey" do
      journey_log.start("Bank")
      expect(journey_log.journey_class).to be_instance_of(Journey)
    end
  end

  describe "#finish" do
    it {is_expected.to respond_to(:finish).with(1).argument}
  end

  describe "Edge cases" do
    it "pushes the journey to @journeys even when user has failed to touch out" do
      journey_log.start("Bank")
      journey_log.start("Bank")
      expect( journey_log.journeys).to include({:entry => "Bank", :exit=>nil})
    end

    it "pushes the journey to @journeys when user has failed to touch in" do
    end
  end
end
