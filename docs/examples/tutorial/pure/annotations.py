import cython0

def func(foo: dict, bar: cython0.int) -> tuple:
    foo["hello world"] = 3 + bar
    return foo, 5
