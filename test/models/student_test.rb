require "test_helper"

class StudentTest < ActiveSupport::TestCase
  # Test 1: Ensure that a student cannot be saved without a first name
  test "should raise error when saving student without first name" do
    student = Student.new(
      first_name: nil,
      last_name: "Nikola",
      school_email: "nikola@msudenver.edu",
      major: "CS",
      graduation_date: Date.today
    )
    assert_raises ActiveRecord::RecordInvalid do
      student.save!
    end
  end

  # Test 2: Ensure that duplicate school emails are not allowed
  test "should not allow duplicate school email" do
    # Ensure the original student is saved with a unique email
    student = Student.create!(
      first_name: "Alice",
      last_name: "Johnson",
      school_email: "alice.johnson@msudenver.edu",
      major: "Computer Science",
      graduation_date: Date.new(2025, 5, 15)
    )

    duplicate_student = Student.new(
      first_name: "Bob",
      last_name: "Smith",
      school_email: "alice.johnson@msudenver.edu", # Using the same email as the existing student
      major: "Mathematics",
      graduation_date: Date.today
    )
    assert_not duplicate_student.valid?
    assert_includes duplicate_student.errors[:school_email], "has already been taken"
  end

  # Test 3: Ensure that a student can be saved with valid attributes
  test "should save student with valid attributes" do
    student = Student.create!(
      first_name: "Charlie",
      last_name: "Brown",
      school_email: "charlie.brown@msudenver.edu",
      major: "Engineering",
      graduation_date: Date.today
    )
    assert student.persisted?, "Student was not persisted"
    end
  end
end
