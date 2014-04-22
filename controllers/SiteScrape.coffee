exports.genRandomValue = (codeLength)->
    @chars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXTZabcdefghiklmnopqrstuvwxyz"
    @RandCode = ''
    for i in @chars
        @randNum = Math.floor Math.random() * @chars.length
        @RandCode += @chars.substring(@randNum, @randNum + 1);
    return @RandCode