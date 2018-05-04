require 'spec_helper'

describe UnifiNormalizer::TransferNormalizer do
  it "converts 1 MB to 1.0 (MB)" do
    expect(subject.normalize("1 MB")).to eq("1.0")
  end

  it "converts 12.4 MB to 12.4 (MB)" do
    expect(subject.normalize("1 MB")).to eq("1.0")
  end

  it "converts 1 GB to 1024.0 (MB)" do
    expect(subject.normalize("1 GB")).to eq("1024.0")
  end

  it "converts 1 KB to 0.000976562 (MB)" do
    expect(subject.normalize("1 KB")).to eq("0.0009765625")
  end

  it "converts 124.9 KB to 0.121972656 (MB)" do
    expect(subject.normalize("124.9 KB")).to eq("0.12197265625")
  end

  it "converts 2.4 TB to 2516582.4 (MB)" do
    expect(subject.normalize("2.4 TB")).to eq("2516582.4")
  end
end
