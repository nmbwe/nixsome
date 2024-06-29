{ nixpkgs, programs, ... }: {
    programs.git = {
        enable = true;
        config = {
            user.name  = "jaoleal";
            user.email = "jgleal@protonmail.com";
            user.signingkey = "0x7A629C279CD8DF04!";
            #master eh meu ovo de havaianas
            init.defaultBranch = "main";
            commit.gpgsign = true;
        };
    };
}