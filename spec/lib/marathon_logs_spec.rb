require "marathon_logs"

describe MarathonLogs do
  subject { described_class.new }

  describe "#create_log" do
    context "when logged a marathon twice" do
      before do
        2.times do
          subject.create_log(duration: rand(10), distance: rand(8))
        end
      end

      it "returns 2" do
        expect(subject.logs.count).to eq 2
      end
    end

    context "when logging a duration of 10 hrs and distance of 8 km" do
      let(:expected_message) { "Duration: 10 hour/s, Distance: 8 km/s." }
      it "creates a log and returns a message with the duration and distance" do
        message = subject.create_log(duration: 10, distance: 8)

        expect(message). to eq(expected_message)
        expect(subject.logs.count).to eq(1)
        expect(subject.logs.first).to eq(duration: 10, distance: 8)
      end
    end
  end

  # 2. describe "#count_logs"


  describe "#count_logs" do
    context "when there is no logs created" do
      it "returns 0" do
        expect(subject.count_logs).to eq(0)
      end
    end

    context "when multiple logs are created" do
      it "returns the total number of logs" do
        # 5.times { subject.create_log(duration: rand(4), distance: rand(10)) }
        subject.create_log(duration: 5, distance: 12)
        subject.create_log(duration: 3, distance: 8)
        subject.create_log(duration: 4, distance: 15)
        subject.create_log(duration: 7, distance: 20)
        subject.create_log(duration: 6, distance: 30)

        expect(subject.count_logs).to eq(5)
      end
    end
  end
  
  # for the total duration
end
