classdef MyClass
    properties
        val1
        val2
    end
    methods
        function obj = MyClass()
            obj.val1 = 1
            obj.val2 = 2
        end
        function obj = set.val1(obj, value)
            obj.val1 = value
        end
    end
end
