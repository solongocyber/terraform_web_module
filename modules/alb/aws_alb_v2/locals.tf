locals { 
    name = "aws-${var.env}-${var.project}-rtype"
    common_tags = {
        env = "var.env"
        project = "var.project"
        
    }
}
