require 'spec_helper'

describe UnifiNormalizer::DurationNormalizer do
  it "converts 10 seconds to 0.1 (minutes)" do
    expect(subject.normalize("6s")).to eq("0.1")
  end

  it "converts 1 minute to 1 (minutes)" do
    expect(subject.normalize("1m")).to eq("1.0")
  end

  it "converts 1 min 30 seconds to 1.5 (minutes)" do
    expect(subject.normalize("1m 30s")).to eq("1.5")
  end
end
