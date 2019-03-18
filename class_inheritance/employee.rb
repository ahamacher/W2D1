class Employee
    attr_reader :salary
    def initialize(name, title, salary, manager = nil)
        @name = name 
        @title = title 
        @salary = salary
        @manager = manager
    end
    def bonus(multiplier)
        bonus = @salary * multiplier
        bonus
    end
end

class Manager < Employee
    attr_reader :employees

    def initialize(name, title, salary, manager = nil, employees = [] )
        super(name, title, salary, manager)
        @employees = employees
    end

    def bonus(multiplier)
        salary_sum = 0
        @employees.each do |emmployee|
            if emmployee.is_a?(Manager)
                salary_sum += emmployee.bonus(multiplier)
            else
                salary_sum += super
            end
        end
        salary_sum

        # sum_salary = 0
        # @employees.each { |employee| sum_salary+=employee.salary }
        # bonus = sum_salary * multiplier 
        # bonus
    end

    def add_employee(employee)
        @employees << employee
    end
end


ned = Manager.new( "Ned", "Founder", 1000000 )
darren = Manager.new("Darren", "TA Manager", 78000, ned)
shawna = Employee.new("Shawna", "TA", 12000,darren)
david = Employee.new("David", "TA", 10000,darren)

darren.add_employee(shawna)
darren.add_employee(david)
ned.add_employee(darren)





