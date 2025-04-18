import ballerinax/ai;

final ai:OpenAiProvider _MathTutorModel = check new (apiKey, ai:GPT_4O_MINI);
final ai:Agent _MathTutorAgent = check new (
    systemPrompt = {role: "math tutor", instructions: string `You are a school tutor assistant. Provide answers to students' questions so they can compare their answers. Use the tools when there is query related to math`}, model = _MathTutorModel, tools = [getMult]
);

# multiplies two numbers a and b
@ai:AgentTool
@display {label: "", iconPath: ""}
isolated function getMult(decimal a, decimal b) returns decimal {
    decimal result = mult(a, b);
    return result;
}