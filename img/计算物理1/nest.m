% 定义一个简单的匿名函数
f = @(x) x;
x = 2;
n = 0;  % 将函数f嵌套应用3次

g = @(x) nestedApplyFunction(f, x, n) - x; % 减0使其符合fzero的要求

x0 = 0;
root = fzero(g, x0);

plot(0:0.1:1,g(0:0.1:1))

disp(['找到的零点是: ', num2str(root)]);


function result = nestedApplyFunction(f, x, n)
    if n == 0
        result = x;
    else
        result = nestedApplyFunction(f, f(x), n - 1);
    end
end
