require File.expand_path(File.dirname(__FILE__) + '/neo')

class AboutInheritance < Neo::Koan
  class Dog
    attr_reader :name

    def initialize(name)
      @name = name
    end

    def bark
      "WOOF"
    end
  end

  class Chihuahua < Dog
    def wag
      :happy
    end

    def bark
      "yip"
    end
  end

  def test_subclasses_have_the_parent_as_an_ancestor
    assert_equal __, Chihuahua.ancestors.include?(Dog)
  end

  def test_all_classes_ultimately_inherit_from_object
    assert_equal __, Chihuahua.ancestors.include?(Object)
  end

  def test_subclasses_inherit_behavior_from_parent_class
    chico = Chihuahua.new("Chico")
    assert_equal __, chico.name
  end

  def test_subclasses_add_new_behavior
    chico = Chihuahua.new("Chico")
    assert_equal __, chico.wag

    # assert_raise is a bit reversed from what you would expect: the
    # thing that you put in the blank should be the class name of the
    # error that the code in the do block executes. That is: look at
    # the *second* part of your error to find the answer.
    assert_raise(___) do
      fido = Dog.new("Fido")
      fido.wag
    end
  end

  def test_subclasses_can_modify_existing_behavior
    chico = Chihuahua.new("Chico")
    assert_equal __, chico.bark

    fido = Dog.new("Fido")
    assert_equal __, fido.bark
  end

  # ------------------------------------------------------------------

  class BullDog < Dog
    def bark
      super + ", GROWL"
    end
  end

  def test_subclasses_can_invoke_parent_behavior_via_super
    ralph = BullDog.new("Ralph")
    assert_equal __, ralph.bark
  end

  # ------------------------------------------------------------------

  class GreatDane < Dog
    def growl
      # What is super? Remember that super above called a method, and
      # did not refer to the name of the class.
      super.bark + ", GROWL"
    end
  end

  def test_super_does_not_work_cross_method
    george = GreatDane.new("George")
    assert_raise(___) do
      george.growl
    end
  end

end
