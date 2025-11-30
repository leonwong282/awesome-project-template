# 📜 License Selection Guide

> Choose the right license for your project

---

## Quick Comparison

| License | Permissions | Conditions | Use Case |
|---------|-------------|------------|----------|
| **MIT** | Commercial use, modify, distribute | Must include license | Maximum freedom |
| **Apache-2.0** | Commercial use, modify, distribute, patent use | Must include license + changes | Enterprise-friendly |
| **GPL-3.0** | Commercial use, modify, distribute | Must open source derivatives | Strong copyleft |

---

## 🟢 MIT License

**Best for**: Maximum adoption, libraries, tools

### You CAN:
- ✅ Use commercially
- ✅ Modify
- ✅ Distribute
- ✅ Use privately

### You MUST:
- 📋 Include license and copyright notice

### You CANNOT:
- ❌ Hold author liable

### Example Projects
- React, Vue.js, jQuery, Node.js, Rails

---

## 🔵 Apache License 2.0

**Best for**: Enterprise software, patent protection needed

### You CAN:
- ✅ Use commercially
- ✅ Modify
- ✅ Distribute
- ✅ Use privately
- ✅ Use patents

### You MUST:
- 📋 Include license and copyright notice
- 📋 State changes made

### You CANNOT:
- ❌ Hold author liable
- ❌ Use trademarks

### Example Projects
- Kubernetes, TensorFlow, Apache projects

---

## 🔴 GPL-3.0 License (Current)

**Best for**: Projects that must remain open source

### You CAN:
- ✅ Use commercially
- ✅ Modify
- ✅ Distribute
- ✅ Use privately

### You MUST:
- 📋 Include license and copyright notice
- 📋 State changes made
- 📋 Disclose source code
- 📋 Use same license for derivatives

### You CANNOT:
- ❌ Hold author liable

### Example Projects
- Linux kernel, WordPress, GIMP

---

## 🤔 How to Choose

```
Do you want maximum adoption?
├── Yes → MIT
└── No
    │
    ├── Do you need patent protection?
    │   ├── Yes → Apache-2.0
    │   └── No
    │       │
    │       └── Do you want derivatives to stay open source?
    │           ├── Yes → GPL-3.0
    │           └── No → MIT or Apache-2.0
```

---

## 🔄 Changing the License

### From this Template

1. Delete the current `LICENSE` file
2. Create a new `LICENSE` file with your chosen license
3. Update copyright year and name in the new license
4. Update any license badges in `README.md`

### License Text Sources

- **MIT**: https://choosealicense.com/licenses/mit/
- **Apache-2.0**: https://choosealicense.com/licenses/apache-2.0/
- **GPL-3.0**: https://choosealicense.com/licenses/gpl-3.0/

---

## 📚 Additional Resources

- [Choose a License](https://choosealicense.com/) - GitHub's license chooser
- [SPDX License List](https://spdx.org/licenses/) - Full list of open source licenses
- [OSI Approved Licenses](https://opensource.org/licenses/) - Open Source Initiative

---

## ⚠️ Disclaimer

This guide is for informational purposes only and does not constitute legal advice. Consult a legal professional for specific licensing questions.
